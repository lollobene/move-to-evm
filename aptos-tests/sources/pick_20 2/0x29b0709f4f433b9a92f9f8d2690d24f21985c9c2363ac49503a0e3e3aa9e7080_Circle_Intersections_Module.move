


module Verse_000001::Circle_Intersections_Module {
	
	/*
		let intersect : bool = circles_intersect (50,50,4, 46,46,4);
	
		 _____________ 100
		|
		|           *
		|          /| b
		|   /       | 
		|  *-------- 
		|       a
		|
		
		c^2 = a^2 + b^2
		
		does
		(c1_r + c2_r) ^ 2 = c^2
	*/
	#[view] public fun circles_intersect (
		c1_x : u64,
		c1_y : u64,
		c1_r : u64,

		c2_x : u64,
		c2_y : u64,
		c2_r : u64
	) : bool {
		use std::math64;
		
		let a = distance (c1_x, c2_x);
		let b = distance (c1_y, c2_y);

		//
		// Both of the these are integers
		// without rounding.
		//
		let c_sqr = math64::pow (a, 2) + math64::pow (b, 2);
		let rr_sqr = math64::pow (c1_r + c2_r, 2);
		
		if (c_sqr > rr_sqr) {
			return false
		};
		
		true
	}
	#[test] public fun circles_intersect__monitor_1 () {
		/*
			<svg xmlns='http://www.w3.org/2000/svg' viewBox="0 0 100 100">
				<g style="fill: #000000; fill-opacity: 1;">
					<circle cx="50" cy="50" r="2" />
					<circle cx="48" cy="48" r="2" />
				</g>
			</svg>
		*/
		
		assert! (circles_intersect (50,50,4, 46,46,4) == true, 1);
		
		assert! (circles_intersect (50,50,2, 46,46,2) == false, 1);
		assert! (circles_intersect (50,50,2, 46,46,3) == false, 1);
	}
	
	
	
	fun distance (a : u64, b : u64) : u64 {
		if (a > b) { return a - b; };
		(b - a)
	}
	#[test] public fun distance__monitor_1 () {
		assert! (distance (1,2) == 1, 1);
		assert! (distance (2,1) == 1, 1);
		assert! (distance (2,2) == 0, 1);
	}
	
	
	
}