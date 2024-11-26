/*=====================================================*
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *=====================================================*/


/// @use-src 0:"IntToBytes4Mapping.sol"
object "MappingTest_42" {
    code {
        /// @src 0:60:398  "contract MappingTest {..."
        mstore(64, memoryguard(128))
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        constructor_MappingTest_42()

        let _1 := allocate_unbounded()
        codecopy(_1, dataoffset("MappingTest_42_deployed"), datasize("MappingTest_42_deployed"))

        return(_1, datasize("MappingTest_42_deployed"))

        function allocate_unbounded() -> memPtr {
            memPtr := mload(64)
        }

        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
            revert(0, 0)
        }

        /// @src 0:60:398  "contract MappingTest {..."
        function constructor_MappingTest_42() {

            /// @src 0:60:398  "contract MappingTest {..."

        }
        /// @src 0:60:398  "contract MappingTest {..."

    }
    /// @use-src 0:"IntToBytes4Mapping.sol"
    object "MappingTest_42_deployed" {
        code {
            /// @src 0:60:398  "contract MappingTest {..."
            mstore(64, memoryguard(128))

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x9507d39a
                {
                    // get(uint256)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    let ret_0 :=  fun_get_41(param_0)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_bytes4__to_t_bytes4__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xe48899e6
                {
                    // set(uint256,bytes4)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0, param_1 :=  abi_decode_tuple_t_uint256t_bytes4(4, calldatasize())
                    fun_set_29(param_0, param_1)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                default {}
            }

            revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74()

            function shift_right_224_unsigned(value) -> newValue {
                newValue :=

                shr(224, value)

            }

            function allocate_unbounded() -> memPtr {
                memPtr := mload(64)
            }

            function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
                revert(0, 0)
            }

            function revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() {
                revert(0, 0)
            }

            function revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() {
                revert(0, 0)
            }

            function cleanup_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function validator_revert_t_uint256(value) {
                if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
            }

            function abi_decode_t_uint256(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_uint256(value)
            }

            function abi_decode_tuple_t_uint256(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function cleanup_t_bytes4(value) -> cleaned {
                cleaned := and(value, 0xffffffff00000000000000000000000000000000000000000000000000000000)
            }

            function abi_encode_t_bytes4_to_t_bytes4_fromStack(value, pos) {
                mstore(pos, cleanup_t_bytes4(value))
            }

            function abi_encode_tuple_t_bytes4__to_t_bytes4__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_bytes4_to_t_bytes4_fromStack(value0,  add(headStart, 0))

            }

            function validator_revert_t_bytes4(value) {
                if iszero(eq(value, cleanup_t_bytes4(value))) { revert(0, 0) }
            }

            function abi_decode_t_bytes4(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_bytes4(value)
            }

            function abi_decode_tuple_t_uint256t_bytes4(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 32

                    value1 := abi_decode_t_bytes4(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74() {
                revert(0, 0)
            }

            function identity(value) -> ret {
                ret := value
            }

            function convert_t_uint256_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_uint256(value)))
            }

            function mapping_index_access_t_mapping$_t_uint256_$_t_bytes4_$_of_t_uint256(slot , key) -> dataSlot {
                mstore(0, convert_t_uint256_to_t_uint256(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function shift_left_0(value) -> newValue {
                newValue :=

                shl(0, value)

            }

            function update_byte_slice_4_shift_0(value, toInsert) -> result {
                let mask := 0xffffffff
                toInsert := shift_left_0(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function convert_t_bytes4_to_t_bytes4(value) -> converted {
                converted := cleanup_t_bytes4(value)
            }

            function prepare_store_t_bytes4(value) -> ret {
                ret := shift_right_224_unsigned(value)
            }

            function update_storage_value_offset_0t_bytes4_to_t_bytes4(slot, value_0) {
                let convertedValue_0 := convert_t_bytes4_to_t_bytes4(value_0)
                sstore(slot, update_byte_slice_4_shift_0(sload(slot), prepare_store_t_bytes4(convertedValue_0)))
            }

            /// @ast-id 29
            /// @src 0:175:296  "function set(uint256 key, bytes4 value) public {..."
            function fun_set_29(var_key_11, var_value_13) {

                /// @src 0:250:255  "value"
                let _1 := var_value_13
                let expr_19 := _1
                /// @src 0:232:242  "typeHashes"
                let _2 := 0x00
                let expr_16 := _2
                /// @src 0:243:246  "key"
                let _3 := var_key_11
                let expr_17 := _3
                /// @src 0:232:247  "typeHashes[key]"
                let _4 := mapping_index_access_t_mapping$_t_uint256_$_t_bytes4_$_of_t_uint256(expr_16,expr_17)
                /// @src 0:232:255  "typeHashes[key] = value"
                update_storage_value_offset_0t_bytes4_to_t_bytes4(_4, expr_19)
                let expr_20 := expr_19
                /// @src 0:284:289  "value"
                let _5 := var_value_13
                let expr_25 := _5
                /// @src 0:265:276  "typeHashes2"
                let _6 := 0x01
                let expr_22 := _6
                /// @src 0:277:280  "key"
                let _7 := var_key_11
                let expr_23 := _7
                /// @src 0:265:281  "typeHashes2[key]"
                let _8 := mapping_index_access_t_mapping$_t_uint256_$_t_bytes4_$_of_t_uint256(expr_22,expr_23)
                /// @src 0:265:289  "typeHashes2[key] = value"
                update_storage_value_offset_0t_bytes4_to_t_bytes4(_8, expr_25)
                let expr_26 := expr_25

            }
            /// @src 0:60:398  "contract MappingTest {..."

            function zero_value_for_split_t_bytes4() -> ret {
                ret := 0
            }

            function shift_right_0_unsigned(value) -> newValue {
                newValue :=

                shr(0, value)

            }

            function shift_left_224(value) -> newValue {
                newValue :=

                shl(224, value)

            }

            function cleanup_from_storage_t_bytes4(value) -> cleaned {
                cleaned := shift_left_224(value)
            }

            function extract_from_storage_value_offset_0t_bytes4(slot_value) -> value {
                value := cleanup_from_storage_t_bytes4(shift_right_0_unsigned(slot_value))
            }

            function read_from_storage_split_offset_0_t_bytes4(slot) -> value {
                value := extract_from_storage_value_offset_0t_bytes4(sload(slot))

            }

            /// @ast-id 41
            /// @src 0:302:396  "function get(uint256 key) public view returns (bytes4) {..."
            function fun_get_41(var_key_31) -> var__34 {
                /// @src 0:349:355  "bytes4"
                let zero_t_bytes4_9 := zero_value_for_split_t_bytes4()
                var__34 := zero_t_bytes4_9

                /// @src 0:374:384  "typeHashes"
                let _10 := 0x00
                let expr_36 := _10
                /// @src 0:385:388  "key"
                let _11 := var_key_31
                let expr_37 := _11
                /// @src 0:374:389  "typeHashes[key]"
                let _12 := mapping_index_access_t_mapping$_t_uint256_$_t_bytes4_$_of_t_uint256(expr_36,expr_37)
                let _13 := read_from_storage_split_offset_0_t_bytes4(_12)
                let expr_38 := _13
                /// @src 0:367:389  "return typeHashes[key]"
                var__34 := expr_38
                leave

            }
            /// @src 0:60:398  "contract MappingTest {..."

        }

        data ".metadata" hex"a3646970667358221220cc3ba214924a7983a3861c4bc4df0a65d91ee88314582a2a753a2fce64a68c836c6578706572696d656e74616cf564736f6c634300080b0041"
    }

}

