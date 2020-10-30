
function [M1, idxs1] = expand_part(M, M1, idxs1)
    E = [M.TRIV(:, [1, 2]); M.TRIV(:, [2, 3]); M.TRIV(:, [3, 1])];
    Adj = sparse(E(:, 1), E(:, 2), 1, M.n, M.n);
    Adj = double(Adj + Adj' > 0);
    Adj(1:M.n+1:end) = 1;
    
    f1 = zeros(M.n, 1);
    f1(idxs1) = 1;  
    
    while networkComponents(vertex2vertex(M1)) > 1
        f1 = Adj * f1;
        
        M1 = mesh.proc.cut_mesh(M, f1 > 0);
    end
    
    f1 = Adj * f1;
    M1 = mesh.proc.cut_mesh(M, f1 > 0);
    idxs1 = find(f1 > 0);
end
