% Final Project: Simulating Craps
% Mychaela Paetow 

% The rules of the game are as follows: 
% Player rolls 2 dice. 
% If sum is 7 or 11, pass bets win.
% If sum is 12, boxcars (neither bet wins).
% If sum is 2 or 3, pass bets lose.
% If sum is 4, 5, 6, 8, 9, or 10, shooter repeatedly rolls two dice until
% the new sum is the original sum or 7.
% If the new sum equals the original sum, then pass bets win.
% If  the new sum is 7, then don't pass bets win.

clear all
close all 
format compact

% Set the number of simulations
n = 500
% Set the initial value to 0 for the number of wins for each bet
num_dontpass_wins = 0;
num_pass_wins = 0;
% Set the initial value to 0 for the number of rolls per game
num_rolls = 0;

% Run the simulations
for i=1:n
    % Roll the dice and find their sum
    die1 = randi(6)
    die2 = randi(6)
    sum = die1 + die2
    % If sum is 7 or 11, pass bets win.
    if (sum == 7 || sum == 11)
        num_pass_wins = num_pass_wins + 1
        num_rolls = num_rolls + 1
    % If sum is 2 or 3, don't pass bets win.
    elseif (sum == 2 || sum == 3)
        num_dontpass_wins = num_dontpass_wins + 1
        num_rolls = num_rolls + 1
    % If sum is 12, neither bet wins. 
    elseif (sum == 12)
        num_pass_wins = num_pass_wins
        num_dontpass_wins = num_dontpass_wins 
        num_rolls = num_rolls + 1
    % Otherwise, dice are rolled again. The "sum" becomes the point. 
    else
        while (true)
            num_rolls = num_rolls + 1
    % Dice are rolled until the new sum equals the original sum or 7. 
            die1 = randi(6)
            die2 = randi(6)
            sum_new = die1 + die2
    % If the new sum equals the original sum, pass bets win.
            if (sum_new == sum)
                num_pass_wins = num_pass_wins + 1
    % If the new sum equals 7, don't pass bets win.            
                break;
            elseif (sum_new == 7)
                num_dontpass_wins = num_dontpass_wins + 1
                
                break;
            end
        end
    end
end

% Estimate the probability of winning a pass bet
prob_pass_bet = (num_pass_wins/n)

% Estimate the probability of winning a don't pass bet 
prob_dontpass_bet = (num_dontpass_wins/n)

% Estimate the average length of a game 
avg_length_craps = (num_rolls/n)

z = [1000 10000 100000 1000000]
prob_p = [.5000 .4944 .4915 .4927]
prob_dp = [.4590 .4792 .4804 .4792]

figure(1)
plot(z, prob_p, '-')
hold on
plot(z, prob_dp, '-')
title("Probabilities v. Number of Trials (Pass in Blue, Don't Pass in Red)")

    
