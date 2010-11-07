% Check whether a binary tree is balanced (depths of both subtrees differ by 
% at most one, and each subtree is balanced as well).

% consult('tree.pl').
% balanced_tree(T), balanced(T, H, R).
% unbalanced_tree(T), balanced(T, H, R).

balanced_tree(
    t(
        6,
        t(
            4,
            t(2, nil, nil),
            t(5, nil, nil)
        ),
        t(
            9,
            t(7, nil, nil),
            nil
        )
    )
).


unbalanced_tree(
    t(
        6,
        t(
            4,
            t(2,
                t(1,
                    t(0, nil, nil),
                    t(2, nil, nil)
                ),
                t(3, nil, nil)
            ),
            t(5, nil, nil)
        ),
        t(
            9,
            t(7, nil, nil),
            nil
        )
    )
).


max(X, X, X).
max(X, Y, Y) :-
    Y>X, !. 
max(X, _, X). 


height(nil, 0).
height(t(_, L, R), H) :- 
    height(L, H1),
    height(R, H2),
    max(H1, H2, H3),
    H is H3+1.

balanced_height(X, X, true).
balanced_height(X, Y, true) :- X is Y+1.
balanced_heihgt(X, Y, true) :- Y is X+1.

balanced(nil, 0, _).
balanced(t(_, L, R), Height, Result) :-
    balanced(L, HL, _),
    balanced(R, HR, _),
    max(HL, HR, HH),
    Height is HH+1,
    balanced_height(HL, HR, Result).

