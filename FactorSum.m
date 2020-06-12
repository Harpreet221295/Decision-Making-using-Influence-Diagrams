function F = FactorSum(A, B)


if(isempty(A.var))
	F = B;
	return;
end;

if(isempty(B.var))
	F = A;
	return;
end;


F = struct('var', [], 'card', [], 'val', []);
F.var = union(A.var, B.var);

% b = setdiff(B.var, A.var);
% [_, mapA] = setdiff(F.var, b);
[_, mapA] = ismember(A.var, F.var);

% a = setdiff(A.var, B.var);
% [_, mapB] = setdiff(F.var, a);
[_, mapB] = ismember(B.var, F.var);



F.card = zeros(1, length(F.var));
F.card(mapA) = A.card;
F.card(mapB) = B.card;

F_assign = IndexToAssignment(1:prod(F.card), F.card);

A_assign = F_assign(:, mapA);
B_assign = F_assign(:, mapB);

A_indx = AssignmentToIndex(A_assign, A.card);
B_indx = AssignmentToIndex(B_assign, B.card);

F.val = zeros(1, prod(F.card));
F.val = A.val(A_indx) + B.val(B_indx);

end;