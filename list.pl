our_list([1,2,3,4,5]).

insert([],E,_,_,[E]).
insert([H|L],E,Index,Index,[E,H|L]).
insert([H|L],E,Index,CIndex,[H|Result]) :-
    NIndex is CIndex + 1,
    insert(L, E, Index, NIndex, Result).

insert(List, Element, Index, Result) :-
    insert(List, Element, Index, 1, Result).


progress_insert([],_,_,_,[]).
progress_insert([H|L], E, Index, Index, [H,E|Result]) :-
    NCIndex is Index + 1,
    NIndex is Index * 2,
    progress_insert(L, E, NIndex, NCIndex, Result).

progress_insert([H|L],E,Index,CIndex,[H|Result]) :-
    NIndex is CIndex + 1,
    progress_insert(L, E, Index, NIndex, Result).

progress_insert(List, Element, Result) :-
    progress_insert(List, Element, 1, 1, Result).
