% Sudoku Solver - Question 1b

% Define the cells and possible numbers
cell(1..4).
number(1..4).

% Put exactly one number in each cell
1 { sudoku(X,Y,N) : number(N) } 1 :- cell(X), cell(Y).

% Keep all of the initial values
:- initial(X,Y,N), not sudoku(X,Y,N).

% No duplicate numbers in the same row
:- sudoku(X,Y1,N), sudoku(X,Y2,N), Y1 != Y2.

% No duplicate numbers in the same column
:- sudoku(X1,Y,N), sudoku(X2,Y,N), X1 != X2.

% Determine which 2x2 subgrid each cell belongs to
subgrid(X,Y,1 + (((X-1)/2)*2 + (Y-1)/2)) :- cell(X), cell(Y).

#show sudoku/3.
#show subgrid/3.