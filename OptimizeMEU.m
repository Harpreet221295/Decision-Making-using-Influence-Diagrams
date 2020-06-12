% Copyright (C) Daphne Koller, Stanford University, 2012

function [MEU OptimalDecisionRule] = OptimizeMEU( I )

  % Inputs: An influence diagram I with a single decision node and a single utility node.
  %         I.RandomFactors = list of factors for each random variable.  These are CPDs, with
  %              the child variable = D.var(1)
  %         I.DecisionFactors = factor for the decision node.
  %         I.UtilityFactors = list of factors representing conditional utilities.
  % Return value: the maximum expected utility of I and an optimal decision rule 
  % (represented again as a factor) that yields that expected utility.
  
  % We assume I has a single decision node.
  % You may assume that there is a unique optimal decision.
  D = I.DecisionFactors(1);

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
  OptimalDecisionRule = struct('var', [], 'card', [], 'val', []);
  
  %OptimalDecisionRule.var = D.var;
  %ptimalDecisionRule.card = D.card;
  %OptimalDecisionRule.val = zeros(1, prod(D.card));

  euf = CalculateExpectedUtilityFactor( I );




  D_par = D.var(2:end);
  D_par_card = D.card(2:end);



  if(isempty(D_par)),
      [v idx] = max(euf.val);
      OptimalDecisionRule.var = D.var;
      OptimalDecisionRule.card = D.card;
      OptimalDecisionRule.val = zeros(1, D.card);      
      OptimalDecisionRule.val(idx) = 1;
      MEU = v;

  else,
      D_var = D.var(1);
      D_var_idx = find(euf.var == D_var);
      

      B = struct('var', [], 'card', [], 'val', []);
      [B.var, mapB] = setdiff(euf.var, D_var);
      B.card = euf.card(mapB);
      B.val = repmat([-1 -Inf], prod(B.card), 1);
      euf_assigns = IndexToAssignment(1:length(euf.val),euf.card);
      B_indx = AssignmentToIndex(euf_assigns(:, mapB), B.card);



      for i=1:length(euf.val),
          if(euf.val(i) > B.val(B_indx(i), 2)),
            B.val(B_indx(i), 2) = euf.val(i);
            B.val(B_indx(i), 1) = IndexToAssignment(i, euf.card)(D_var_idx);
          end;
      end;

      OptimalDecisionRule.var = [D_var B.var];
      OptimalDecisionRule.card = [D.card(1) B.card];
      OptimalDecisionRule.val = zeros(1,prod(OptimalDecisionRule.card));

      MEU = 0;

      for i=1:length(B.val),
          OptimalDecisionRule.val(AssignmentToIndex([B.val(i, 1) IndexToAssignment(i, B.card)], OptimalDecisionRule.card)) = 1;
          MEU+=B.val(i,2);
      end;

  end;

    





  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    

end
