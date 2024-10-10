// Move bytecode v6
module 123.moduleA {
struct A has store, key {
	a: u64,
	b: u64
}

public create(Arg0: u64, Arg1: u64): A /* def_idx: 0 */ {
B0:
	0: MoveLoc[0](Arg0: u64)
	1: MoveLoc[1](Arg1: u64)
	2: Pack[0](A)
	3: Ret
}
public get(Arg0: address): A /* def_idx: 1 */ {
B0:
	0: MoveLoc[0](Arg0: address)
	1: MoveFrom[0](A)
	2: Ret
}
public main(Arg0: &signer) /* def_idx: 2 */ {
L1:	loc0: A
B0:
	0: LdU64(10)
	1: LdU64(44)
	2: Call create(u64, u64): A
	3: StLoc[1](loc0: A)
	4: MoveLoc[0](Arg0: &signer)
	5: MoveLoc[1](loc0: A)
	6: Call write(&signer, A)
	7: Ret
}
public read(Arg0: address): u64 /* def_idx: 3 */ {
B0:
	0: MoveLoc[0](Arg0: address)
	1: ImmBorrowGlobal[0](A)
	2: ImmBorrowField[0](A.a: u64)
	3: ReadRef
	4: Ret
}
public read_struct(Arg0: &A): u64 /* def_idx: 4 */ {
B0:
	0: MoveLoc[0](Arg0: &A)
	1: ImmBorrowField[0](A.a: u64)
	2: ReadRef
	3: Ret
}
public write(Arg0: &signer, Arg1: A) /* def_idx: 5 */ {
B0:
	0: MoveLoc[0](Arg0: &signer)
	1: MoveLoc[1](Arg1: A)
	2: MoveTo[0](A)
	3: Ret
}
}