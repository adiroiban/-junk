% Insert a given value v after the 1-st, 2-nd, 4-th, 8-th ... element of a list.
% progress_insert([1,2,3,4,5,6,7,8,9,10,11,12],x,R).

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

merge_lists(R, [], R).
merge_lists([], R, R).
merge_lists([H|L1], [H|L2], [H | Result]) :-
    merge_lists(L1, L2, Result).
merge_lists([H1|L1], [H2|L2], [H1 | Result]) :-
    H1 < H2,
    merge_lists(L1, [H2|L2], Result).
merge_lists([H1|L1], [H2|L2], [H2 | Result]) :-
    H1 > H2,
    merge_lists([H1|L1], L2, Result).


last_element([Last], Last).
last_element([_|L], Last) :- last_element(L,Last).


wo_last_element([_], []).
wo_last_element([H|L], [H|RestResult]) :- wo_last_element(L, RestResult).


add_last_element([], Element, [Element]).
add_last_element([H|List], Element, [H|PartResult]):-
    add_last_element(List, Element, PartResult).

length_list([],0).
length_list([_|L],Result) :-
    length_list(L, PartResult),
    Result is PartResult + 1.


