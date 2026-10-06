% Sudoku Solver - Question 1c

% Define the cells and possible numbers
cell(1..4).
number(1..4).

% Put exactly one number from 1 to 4 in each cell
1 { sudoku(X,Y,N) : number(N) } 1 :- cell(X), cell(Y).

% Keep all initial values
:- initial(X,Y,N), not sudoku(X,Y,N).

% No duplicate numbers in the same row
:- sudoku(X,Y1,N), sudoku(X,Y2,N), Y1 != Y2.

% No duplicate numbers in the same column
:- sudoku(X1,Y,N), sudoku(X2,Y,N), X1 != X2.

% Determine the 2x2 subgrid for each cell
subgrid(X,Y,1 + (((X-1)/2)*2 + (Y-1)/2)) :- cell(X), cell(Y).

% No duplicate numbers in the same subgrid
:- sudoku(X1,Y1,N), sudoku(X2,Y2,N),
   subgrid(X1,Y1,G), subgrid(X2,Y2,G),
   X1 != X2.

% Only print the Sudoku solution
#show sudoku/3.