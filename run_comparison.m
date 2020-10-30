close all 
clear all

% num evals
k = 10

% load mesh
M = [];
M = load("test_3.mat");
M.TRIV = double(M.TRIV + 1);
M.ind = logical(M.ind(:));
M.n = size(M.VERT, 1);
M.m = size(M.TRIV, 1);
M.id
 
M_dirichlet_inside = M;
M_dirichlet = M;
M_hamiltonian = M;
M_hamiltonian2 = M;

% Use inside approach to compute dirichlet evals (extraxt a submatrix with)
M_dirichlet_inside = mesh.proc.cut_mesh(M_dirichlet_inside, M_dirichlet_inside.ind);
boundary = calc_boundary_edges(M_dirichlet_inside.TRIV);
inside = setdiff(1:M_dirichlet_inside.n, unique(boundary(:)));
[M_dirichlet_inside.S, M_dirichlet_inside.A, M_dirichlet_inside.Al] = mesh.proc.FEM_higher(M_dirichlet_inside, 1, 'neumann');
[evecsR, evals] = eigs(M_dirichlet_inside.S(inside, inside), M_dirichlet_inside.A(inside, inside), k, 1e-10);
'dirichlet "inside"'
diag(evals)


% Explicit modify matrices with boundary dirichlet conditions
M_dirichlet = mesh.proc.cut_mesh(M_dirichlet, M_dirichlet.ind);
[M_dirichlet.S, M_dirichlet.A, M_dirichlet.Al] = mesh.proc.FEM_higher(M_dirichlet, 1, 'dirichlet');
M_dirichlet = mesh.proc.compute_laplace_basis(M_dirichlet, k-1);
'dirichlet'
M_dirichlet.evals


% Use hamiltonian (from luca c. code)
[M_hamiltonian.S, M_hamiltonian.A, M_hamiltonian.Al] = mesh.proc.FEM_higher(M_hamiltonian, 1, 'neumann');
adj = M_hamiltonian.S > 0;
f = not(adj * not(M.ind));
w_gt = 2e5;
v_gt = 1 - f;
[evecs_H, evals_H] = eigs(M_hamiltonian.S + M_hamiltonian.A * mesh.utils.spdiag(w_gt * v_gt), ...
                          M_hamiltonian.A, k, 'SM');
'hamiltonian'
diag(evals_H)


% Use hamiltonian exactly as in pytorch (from luca c. code)
M_hamiltonian2 = M;

[M_hamiltonian2.S, M_hamiltonian2.A, M_hamiltonian2.Al] = mesh.proc.FEM_higher(M_hamiltonian2, 1, 'neumann');
adj = M_hamiltonian2.S > 0;
f = not(adj * not(M.ind));

w_gt = 1e6;
v_gt = 1 -  f;

a_inv = sqrt(1./diag(M_hamiltonian2.Al));
[evecs_H, evals_H] = eigs(M_hamiltonian2.S .* (a_inv' .* a_inv) + ...
                          mesh.utils.spdiag(w_gt * v_gt),         ...
                          k, ...
                          1e-5);
'pytorch hamiltonian'
diag(evals_H)




% Use hamiltonian exactly as in pytorch (from luca c. code) without point
% wise
M_hamiltonian2 = M;

[M_hamiltonian2.S, M_hamiltonian2.A, M_hamiltonian2.Al] = mesh.proc.FEM_higher(M_hamiltonian2, 1, 'neumann');
adj = M_hamiltonian2.S > 0;
f = not(adj * not(M.ind));

w_gt = 1e6;
v_gt = 1 -  f;

a_inv = sqrt(1./diag(M_hamiltonian2.Al));
[evecs_H, evals_H] = eigs(mesh.utils.spdiag(a_inv) * M_hamiltonian2.S  * mesh.utils.spdiag(a_inv) + ...
                          mesh.utils.spdiag(w_gt * v_gt),         ...
                          k, ...
                          1e-5);
'pytorch without point wise'
diag(evals_H)


% Imported hamiltonian from pytorch 
'imported'
torchevals = [ 1.3242,  3.1394,  4.8930,  8.1643, 18.3147, 22.7322, 30.8112, 41.7967, 45.6969, 48.6397];
torchevals'

%%
figure
subplot(121)
mesh.plot.plot_scalar_mesh(M_hamiltonian, double(M.ind));

colorbar
subplot(122)
mesh.plot.plot_scalar_mesh(M_hamiltonian, double(f(:)));
colorbar