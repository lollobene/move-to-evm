/*=====================================================*
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *=====================================================*/


/// @use-src 0:"ResourceDroppingV5.sol", 2:"interfaces/IProtectionLayerProtectorV3.sol"
object "ResourceDroppingV5_683" {
    code {
        /// @src 0:230:6207  "contract ResourceDroppingV5 is IProtectionLayerProtectorV3 {..."
        mstore(64, memoryguard(128))
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        constructor_ResourceDroppingV5_683()

        let _1 := allocate_unbounded()
        codecopy(_1, dataoffset("ResourceDroppingV5_683_deployed"), datasize("ResourceDroppingV5_683_deployed"))

        return(_1, datasize("ResourceDroppingV5_683_deployed"))

        function allocate_unbounded() -> memPtr {
            memPtr := mload(64)
        }

        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
            revert(0, 0)
        }

        function round_up_to_mul_of_32(value) -> result {
            result := and(add(value, 31), not(31))
        }

        function panic_error_0x41() {
            mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
            mstore(4, 0x41)
            revert(0, 0x24)
        }

        function finalize_allocation(memPtr, size) {
            let newFreePtr := add(memPtr, round_up_to_mul_of_32(size))
            // protect against overflow
            if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error_0x41() }
            mstore(64, newFreePtr)
        }

        function allocate_memory(size) -> memPtr {
            memPtr := allocate_unbounded()
            finalize_allocation(memPtr, size)
        }

        function allocate_memory_struct_t_struct$_DroppedRes_$45_storage_ptr() -> memPtr {
            memPtr := allocate_memory(96)
        }

        function cleanup_t_rational_14_by_1(value) -> cleaned {
            cleaned := value
        }

        function cleanup_t_uint256(value) -> cleaned {
            cleaned := value
        }

        function identity(value) -> ret {
            ret := value
        }

        function convert_t_rational_14_by_1_to_t_uint256(value) -> converted {
            converted := cleanup_t_uint256(identity(cleanup_t_rational_14_by_1(value)))
        }

        function write_to_memory_t_uint256(memPtr, value) {
            mstore(memPtr, cleanup_t_uint256(value))
        }

        function cleanup_t_rational_44_by_1(value) -> cleaned {
            cleaned := value
        }

        function convert_t_rational_44_by_1_to_t_uint256(value) -> converted {
            converted := cleanup_t_uint256(identity(cleanup_t_rational_44_by_1(value)))
        }

        function cleanup_t_bool(value) -> cleaned {
            cleaned := iszero(iszero(value))
        }

        function write_to_memory_t_bool(memPtr, value) {
            mstore(memPtr, cleanup_t_bool(value))
        }

        function cleanup_t_uint160(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function convert_t_uint160_to_t_uint160(value) -> converted {
            converted := cleanup_t_uint160(identity(cleanup_t_uint160(value)))
        }

        function convert_t_uint160_to_t_address(value) -> converted {
            converted := convert_t_uint160_to_t_uint160(value)
        }

        function convert_t_address_to_t_address(value) -> converted {
            converted := convert_t_uint160_to_t_address(value)
        }

        function mapping_index_access_t_mapping$_t_address_$_t_struct$_DroppedRes_$45_storage_$_of_t_address(slot , key) -> dataSlot {
            mstore(0, convert_t_address_to_t_address(key))
            mstore(0x20, slot)
            dataSlot := keccak256(0, 0x40)
        }

        function panic_error_0x00() {
            mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
            mstore(4, 0x00)
            revert(0, 0x24)
        }

        function read_from_memoryt_uint256(ptr) -> returnValue {

            let value := cleanup_t_uint256(mload(ptr))

            returnValue :=

            value

        }

        function shift_left_0(value) -> newValue {
            newValue :=

            shl(0, value)

        }

        function update_byte_slice_32_shift_0(value, toInsert) -> result {
            let mask := 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
            toInsert := shift_left_0(toInsert)
            value := and(value, not(mask))
            result := or(value, and(toInsert, mask))
        }

        function convert_t_uint256_to_t_uint256(value) -> converted {
            converted := cleanup_t_uint256(identity(cleanup_t_uint256(value)))
        }

        function prepare_store_t_uint256(value) -> ret {
            ret := value
        }

        function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
            let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
            sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
        }

        function read_from_memoryt_bool(ptr) -> returnValue {

            let value := cleanup_t_bool(mload(ptr))

            returnValue :=

            value

        }

        function update_byte_slice_1_shift_0(value, toInsert) -> result {
            let mask := 255
            toInsert := shift_left_0(toInsert)
            value := and(value, not(mask))
            result := or(value, and(toInsert, mask))
        }

        function convert_t_bool_to_t_bool(value) -> converted {
            converted := cleanup_t_bool(value)
        }

        function prepare_store_t_bool(value) -> ret {
            ret := value
        }

        function update_storage_value_offset_0t_bool_to_t_bool(slot, value_0) {
            let convertedValue_0 := convert_t_bool_to_t_bool(value_0)
            sstore(slot, update_byte_slice_1_shift_0(sload(slot), prepare_store_t_bool(convertedValue_0)))
        }

        function copy_struct_to_storage_from_t_struct$_DroppedRes_$45_memory_ptr_to_t_struct$_DroppedRes_$45_storage(slot, value) {

            {

                let memberSlot := add(slot, 0)
                let memberSrcPtr := add(value, 0)

                let memberValue_0 := read_from_memoryt_uint256(memberSrcPtr)

                update_storage_value_offset_0t_uint256_to_t_uint256(memberSlot, memberValue_0)

            }

            {

                let memberSlot := add(slot, 1)
                let memberSrcPtr := add(value, 32)

                let memberValue_0 := read_from_memoryt_uint256(memberSrcPtr)

                update_storage_value_offset_0t_uint256_to_t_uint256(memberSlot, memberValue_0)

            }

            {

                let memberSlot := add(slot, 2)
                let memberSrcPtr := add(value, 64)

                let memberValue_0 := read_from_memoryt_bool(memberSrcPtr)

                update_storage_value_offset_0t_bool_to_t_bool(memberSlot, memberValue_0)

            }

        }

        function update_storage_value_offset_0t_struct$_DroppedRes_$45_memory_ptr_to_t_struct$_DroppedRes_$45_storage(slot, value_0) {

            copy_struct_to_storage_from_t_struct$_DroppedRes_$45_memory_ptr_to_t_struct$_DroppedRes_$45_storage(slot, value_0)
        }

        /// @ast-id 70
        /// @src 0:1332:1444  "constructor() {..."
        function constructor_ResourceDroppingV5_683() {

            /// @src 0:1332:1444  "constructor() {..."
            constructor_IProtectionLayerProtectorV3_702()

            /// @src 0:1391:1393  "14"
            let expr_57 := 0x0e
            /// @src 0:1395:1397  "44"
            let expr_58 := 0x2c
            /// @src 0:1399:1403  "true"
            let expr_59 := 0x01
            /// @src 0:1380:1404  "DroppedRes(14, 44, true)"
            let expr_60_mpos := allocate_memory_struct_t_struct$_DroppedRes_$45_storage_ptr()
            let _2 := convert_t_rational_14_by_1_to_t_uint256(expr_57)
            write_to_memory_t_uint256(add(expr_60_mpos, 0), _2)
            let _3 := convert_t_rational_44_by_1_to_t_uint256(expr_58)
            write_to_memory_t_uint256(add(expr_60_mpos, 32), _3)
            write_to_memory_t_bool(add(expr_60_mpos, 64), expr_59)
            /// @src 0:1356:1404  "DroppedRes memory res = DroppedRes(14, 44, true)"
            let var_res_55_mpos := expr_60_mpos
            /// @src 0:1434:1437  "res"
            let _4_mpos := var_res_55_mpos
            let expr_66_mpos := _4_mpos
            /// @src 0:1414:1419  "state"
            let _5 := 0x08
            let expr_62 := _5
            /// @src 0:1420:1430  "msg.sender"
            let expr_64 := caller()
            /// @src 0:1414:1431  "state[msg.sender]"
            let _6 := mapping_index_access_t_mapping$_t_address_$_t_struct$_DroppedRes_$45_storage_$_of_t_address(expr_62,expr_64)
            /// @src 0:1414:1437  "state[msg.sender] = res"
            update_storage_value_offset_0t_struct$_DroppedRes_$45_memory_ptr_to_t_struct$_DroppedRes_$45_storage(_6, expr_66_mpos)
            let _7_slot := _6
            let expr_67_slot := _7_slot

        }
        /// @src 0:230:6207  "contract ResourceDroppingV5 is IProtectionLayerProtectorV3 {..."

        /// @src 2:126:294  "interface IProtectionLayerProtectorV3 {..."
        function constructor_IProtectionLayerProtectorV3_702() {

            /// @src 2:126:294  "interface IProtectionLayerProtectorV3 {..."

        }
        /// @src 0:230:6207  "contract ResourceDroppingV5 is IProtectionLayerProtectorV3 {..."

    }
    /// @use-src 0:"ResourceDroppingV5.sol"
    object "ResourceDroppingV5_683_deployed" {
        code {
            /// @src 0:230:6207  "contract ResourceDroppingV5 is IProtectionLayerProtectorV3 {..."
            mstore(64, memoryguard(128))

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x172cfa4c
                {
                    // allocate(uint256,uint256)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0, param_1 :=  abi_decode_tuple_t_uint256t_uint256(4, calldatasize())
                    fun_allocate_105(param_0, param_1)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x29092d0e
                {
                    // remove(address)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    fun_remove_174(param_0)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x2f30c6f6
                {
                    // set(uint256,address)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0, param_1 :=  abi_decode_tuple_t_uint256t_address(4, calldatasize())
                    fun_set_130(param_0, param_1)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x31296c9e
                {
                    // unstoreExternalResource(uint256)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    fun_unstoreExternalResource_264(param_0)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x3e3e7319
                {
                    // protect(address,bytes)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0, param_1 :=  abi_decode_tuple_t_addresst_bytes_memory_ptr(4, calldatasize())
                    let ret_0 :=  fun_protect_375(param_0, param_1)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x5300f82b
                {
                    // isProtected()

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_isProtected_383()
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xa087a87e
                {
                    // read(address)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  fun_read_153(param_0)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xa4ba067e
                {
                    // sink(uint256)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    fun_sink_191(param_0)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xad50b84c
                {
                    // dropResFromStorage(address)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  fun_dropResFromStorage_244(param_0)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xb02137b5
                {
                    // storeExternalResource(uint256)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    fun_storeExternalResource_254(param_0)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xc69fd900
                {
                    // dropRes()

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_dropRes_210()
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
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

            function abi_decode_tuple_t_uint256t_uint256(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 32

                    value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function cleanup_t_uint160(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_t_address(value) -> cleaned {
                cleaned := cleanup_t_uint160(value)
            }

            function validator_revert_t_address(value) {
                if iszero(eq(value, cleanup_t_address(value))) { revert(0, 0) }
            }

            function abi_decode_t_address(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_address(value)
            }

            function abi_decode_tuple_t_address(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

            }

            function abi_decode_tuple_t_uint256t_address(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 32

                    value1 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

            }

            function abi_decode_tuple_t_uint256(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function revert_error_1b9f4a0a5773e33b91aa01db23bf8c55fce1411167c872835e7fa00a4f17d46d() {
                revert(0, 0)
            }

            function revert_error_987264b3b1d58a9c7f8255e93e81c77d86d6299019c33110a076957a3e06e2ae() {
                revert(0, 0)
            }

            function round_up_to_mul_of_32(value) -> result {
                result := and(add(value, 31), not(31))
            }

            function panic_error_0x41() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x41)
                revert(0, 0x24)
            }

            function finalize_allocation(memPtr, size) {
                let newFreePtr := add(memPtr, round_up_to_mul_of_32(size))
                // protect against overflow
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error_0x41() }
                mstore(64, newFreePtr)
            }

            function allocate_memory(size) -> memPtr {
                memPtr := allocate_unbounded()
                finalize_allocation(memPtr, size)
            }

            function array_allocation_size_t_bytes_memory_ptr(length) -> size {
                // Make sure we can allocate memory without overflow
                if gt(length, 0xffffffffffffffff) { panic_error_0x41() }

                size := round_up_to_mul_of_32(length)

                // add length slot
                size := add(size, 0x20)

            }

            function copy_calldata_to_memory(src, dst, length) {
                calldatacopy(dst, src, length)
                // clear end
                mstore(add(dst, length), 0)
            }

            function abi_decode_available_length_t_bytes_memory_ptr(src, length, end) -> array {
                array := allocate_memory(array_allocation_size_t_bytes_memory_ptr(length))
                mstore(array, length)
                let dst := add(array, 0x20)
                if gt(add(src, length), end) { revert_error_987264b3b1d58a9c7f8255e93e81c77d86d6299019c33110a076957a3e06e2ae() }
                copy_calldata_to_memory(src, dst, length)
            }

            // bytes
            function abi_decode_t_bytes_memory_ptr(offset, end) -> array {
                if iszero(slt(add(offset, 0x1f), end)) { revert_error_1b9f4a0a5773e33b91aa01db23bf8c55fce1411167c872835e7fa00a4f17d46d() }
                let length := calldataload(offset)
                array := abi_decode_available_length_t_bytes_memory_ptr(add(offset, 0x20), length, end)
            }

            function abi_decode_tuple_t_addresst_bytes_memory_ptr(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {

                    let offset := calldataload(add(headStart, 32))
                    if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

                    value1 := abi_decode_t_bytes_memory_ptr(add(headStart, offset), dataEnd)
                }

            }

            function cleanup_t_bool(value) -> cleaned {
                cleaned := iszero(iszero(value))
            }

            function abi_encode_t_bool_to_t_bool_fromStack(value, pos) {
                mstore(pos, cleanup_t_bool(value))
            }

            function abi_encode_tuple_t_bool__to_t_bool__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_bool_to_t_bool_fromStack(value0,  add(headStart, 0))

            }

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple_t_uint256__to_t_uint256__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

            }

            function revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74() {
                revert(0, 0)
            }

            function allocate_memory_struct_t_struct$_DroppedRes_$45_storage_ptr() -> memPtr {
                memPtr := allocate_memory(96)
            }

            function write_to_memory_t_uint256(memPtr, value) {
                mstore(memPtr, cleanup_t_uint256(value))
            }

            function write_to_memory_t_bool(memPtr, value) {
                mstore(memPtr, cleanup_t_bool(value))
            }

            function identity(value) -> ret {
                ret := value
            }

            function convert_t_uint160_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(identity(cleanup_t_uint160(value)))
            }

            function convert_t_uint160_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_address_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function mapping_index_access_t_mapping$_t_address_$_t_struct$_DroppedRes_$45_storage_$_of_t_address(slot , key) -> dataSlot {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function shift_right_0_unsigned(value) -> newValue {
                newValue :=

                shr(0, value)

            }

            function cleanup_from_storage_t_bool(value) -> cleaned {
                cleaned := and(value, 0xff)
            }

            function extract_from_storage_value_offset_0t_bool(slot_value) -> value {
                value := cleanup_from_storage_t_bool(shift_right_0_unsigned(slot_value))
            }

            function read_from_storage_split_offset_0_t_bool(slot) -> value {
                value := extract_from_storage_value_offset_0t_bool(sload(slot))

            }

            function array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length) -> updated_pos {
                mstore(pos, length)
                updated_pos := add(pos, 0x20)
            }

            function store_literal_in_memory_7c425b738b4c1593d632d9cf3a12f038068b8f16f040e58d5bee2ce375f0cddf(memPtr) {

                mstore(add(memPtr, 0), "Resource already allocated")

            }

            function abi_encode_t_stringliteral_7c425b738b4c1593d632d9cf3a12f038068b8f16f040e58d5bee2ce375f0cddf_to_t_string_memory_ptr_fromStack(pos) -> end {
                pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 26)
                store_literal_in_memory_7c425b738b4c1593d632d9cf3a12f038068b8f16f040e58d5bee2ce375f0cddf(pos)
                end := add(pos, 32)
            }

            function abi_encode_tuple_t_stringliteral_7c425b738b4c1593d632d9cf3a12f038068b8f16f040e58d5bee2ce375f0cddf__to_t_string_memory_ptr__fromStack(headStart ) -> tail {
                tail := add(headStart, 32)

                mstore(add(headStart, 0), sub(tail, headStart))
                tail := abi_encode_t_stringliteral_7c425b738b4c1593d632d9cf3a12f038068b8f16f040e58d5bee2ce375f0cddf_to_t_string_memory_ptr_fromStack( tail)

            }

            function require_helper_t_stringliteral_7c425b738b4c1593d632d9cf3a12f038068b8f16f040e58d5bee2ce375f0cddf(condition ) {
                if iszero(condition) {
                    let memPtr := allocate_unbounded()
                    mstore(memPtr, 0x08c379a000000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple_t_stringliteral_7c425b738b4c1593d632d9cf3a12f038068b8f16f040e58d5bee2ce375f0cddf__to_t_string_memory_ptr__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function panic_error_0x00() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x00)
                revert(0, 0x24)
            }

            function read_from_memoryt_uint256(ptr) -> returnValue {

                let value := cleanup_t_uint256(mload(ptr))

                returnValue :=

                value

            }

            function shift_left_0(value) -> newValue {
                newValue :=

                shl(0, value)

            }

            function update_byte_slice_32_shift_0(value, toInsert) -> result {
                let mask := 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
                toInsert := shift_left_0(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function convert_t_uint256_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_uint256(value)))
            }

            function prepare_store_t_uint256(value) -> ret {
                ret := value
            }

            function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
                let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
                sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
            }

            function read_from_memoryt_bool(ptr) -> returnValue {

                let value := cleanup_t_bool(mload(ptr))

                returnValue :=

                value

            }

            function update_byte_slice_1_shift_0(value, toInsert) -> result {
                let mask := 255
                toInsert := shift_left_0(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function convert_t_bool_to_t_bool(value) -> converted {
                converted := cleanup_t_bool(value)
            }

            function prepare_store_t_bool(value) -> ret {
                ret := value
            }

            function update_storage_value_offset_0t_bool_to_t_bool(slot, value_0) {
                let convertedValue_0 := convert_t_bool_to_t_bool(value_0)
                sstore(slot, update_byte_slice_1_shift_0(sload(slot), prepare_store_t_bool(convertedValue_0)))
            }

            function copy_struct_to_storage_from_t_struct$_DroppedRes_$45_memory_ptr_to_t_struct$_DroppedRes_$45_storage(slot, value) {

                {

                    let memberSlot := add(slot, 0)
                    let memberSrcPtr := add(value, 0)

                    let memberValue_0 := read_from_memoryt_uint256(memberSrcPtr)

                    update_storage_value_offset_0t_uint256_to_t_uint256(memberSlot, memberValue_0)

                }

                {

                    let memberSlot := add(slot, 1)
                    let memberSrcPtr := add(value, 32)

                    let memberValue_0 := read_from_memoryt_uint256(memberSrcPtr)

                    update_storage_value_offset_0t_uint256_to_t_uint256(memberSlot, memberValue_0)

                }

                {

                    let memberSlot := add(slot, 2)
                    let memberSrcPtr := add(value, 64)

                    let memberValue_0 := read_from_memoryt_bool(memberSrcPtr)

                    update_storage_value_offset_0t_bool_to_t_bool(memberSlot, memberValue_0)

                }

            }

            function update_storage_value_offset_0t_struct$_DroppedRes_$45_memory_ptr_to_t_struct$_DroppedRes_$45_storage(slot, value_0) {

                copy_struct_to_storage_from_t_struct$_DroppedRes_$45_memory_ptr_to_t_struct$_DroppedRes_$45_storage(slot, value_0)
            }

            /// @ast-id 105
            /// @src 0:1450:1673  "function allocate(uint256 a, uint256 b) public {..."
            function fun_allocate_105(var_a_72, var_b_74) {

                /// @src 0:1542:1543  "a"
                let _1 := var_a_72
                let expr_81 := _1
                /// @src 0:1545:1546  "b"
                let _2 := var_b_74
                let expr_82 := _2
                /// @src 0:1548:1552  "true"
                let expr_83 := 0x01
                /// @src 0:1531:1553  "DroppedRes(a, b, true)"
                let expr_84_mpos := allocate_memory_struct_t_struct$_DroppedRes_$45_storage_ptr()
                write_to_memory_t_uint256(add(expr_84_mpos, 0), expr_81)
                write_to_memory_t_uint256(add(expr_84_mpos, 32), expr_82)
                write_to_memory_t_bool(add(expr_84_mpos, 64), expr_83)
                /// @src 0:1507:1553  "DroppedRes memory res = DroppedRes(a, b, true)"
                let var_res_79_mpos := expr_84_mpos
                /// @src 0:1571:1576  "state"
                let _3 := 0x08
                let expr_87 := _3
                /// @src 0:1577:1587  "msg.sender"
                let expr_89 := caller()
                /// @src 0:1571:1588  "state[msg.sender]"
                let _4 := mapping_index_access_t_mapping$_t_address_$_t_struct$_DroppedRes_$45_storage_$_of_t_address(expr_87,expr_89)
                let _5_slot := _4
                let expr_90_slot := _5_slot
                /// @src 0:1571:1593  "state[msg.sender].flag"
                let _6 := add(expr_90_slot, 2)
                let _7 := read_from_storage_split_offset_0_t_bool(_6)
                let expr_91 := _7
                /// @src 0:1597:1602  "false"
                let expr_92 := 0x00
                /// @src 0:1571:1602  "state[msg.sender].flag == false"
                let expr_93 := eq(cleanup_t_bool(expr_91), cleanup_t_bool(expr_92))
                /// @src 0:1563:1633  "require(state[msg.sender].flag == false, \"Resource already allocated\")"
                require_helper_t_stringliteral_7c425b738b4c1593d632d9cf3a12f038068b8f16f040e58d5bee2ce375f0cddf(expr_93)
                /// @src 0:1663:1666  "res"
                let _8_mpos := var_res_79_mpos
                let expr_101_mpos := _8_mpos
                /// @src 0:1643:1648  "state"
                let _9 := 0x08
                let expr_97 := _9
                /// @src 0:1649:1659  "msg.sender"
                let expr_99 := caller()
                /// @src 0:1643:1660  "state[msg.sender]"
                let _10 := mapping_index_access_t_mapping$_t_address_$_t_struct$_DroppedRes_$45_storage_$_of_t_address(expr_97,expr_99)
                /// @src 0:1643:1666  "state[msg.sender] = res"
                update_storage_value_offset_0t_struct$_DroppedRes_$45_memory_ptr_to_t_struct$_DroppedRes_$45_storage(_10, expr_101_mpos)
                let _11_slot := _10
                let expr_102_slot := _11_slot

            }
            /// @src 0:230:6207  "contract ResourceDroppingV5 is IProtectionLayerProtectorV3 {..."

            function store_literal_in_memory_d39e6caf1f8c34c707a2a9080eedd88e4333823fa1b23a8e2a9a348004ce9660(memPtr) {

                mstore(add(memPtr, 0), "Resource not found")

            }

            function abi_encode_t_stringliteral_d39e6caf1f8c34c707a2a9080eedd88e4333823fa1b23a8e2a9a348004ce9660_to_t_string_memory_ptr_fromStack(pos) -> end {
                pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 18)
                store_literal_in_memory_d39e6caf1f8c34c707a2a9080eedd88e4333823fa1b23a8e2a9a348004ce9660(pos)
                end := add(pos, 32)
            }

            function abi_encode_tuple_t_stringliteral_d39e6caf1f8c34c707a2a9080eedd88e4333823fa1b23a8e2a9a348004ce9660__to_t_string_memory_ptr__fromStack(headStart ) -> tail {
                tail := add(headStart, 32)

                mstore(add(headStart, 0), sub(tail, headStart))
                tail := abi_encode_t_stringliteral_d39e6caf1f8c34c707a2a9080eedd88e4333823fa1b23a8e2a9a348004ce9660_to_t_string_memory_ptr_fromStack( tail)

            }

            function require_helper_t_stringliteral_d39e6caf1f8c34c707a2a9080eedd88e4333823fa1b23a8e2a9a348004ce9660(condition ) {
                if iszero(condition) {
                    let memPtr := allocate_unbounded()
                    mstore(memPtr, 0x08c379a000000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple_t_stringliteral_d39e6caf1f8c34c707a2a9080eedd88e4333823fa1b23a8e2a9a348004ce9660__to_t_string_memory_ptr__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            /// @ast-id 130
            /// @src 0:1679:1826  "function set(uint256 a, address owner) public {..."
            function fun_set_130(var_a_107, var_owner_109) {

                /// @src 0:1743:1748  "state"
                let _12 := 0x08
                let expr_113 := _12
                /// @src 0:1749:1754  "owner"
                let _13 := var_owner_109
                let expr_114 := _13
                /// @src 0:1743:1755  "state[owner]"
                let _14 := mapping_index_access_t_mapping$_t_address_$_t_struct$_DroppedRes_$45_storage_$_of_t_address(expr_113,expr_114)
                let _15_slot := _14
                let expr_115_slot := _15_slot
                /// @src 0:1743:1760  "state[owner].flag"
                let _16 := add(expr_115_slot, 2)
                let _17 := read_from_storage_split_offset_0_t_bool(_16)
                let expr_116 := _17
                /// @src 0:1764:1768  "true"
                let expr_117 := 0x01
                /// @src 0:1743:1768  "state[owner].flag == true"
                let expr_118 := eq(cleanup_t_bool(expr_116), cleanup_t_bool(expr_117))
                /// @src 0:1735:1791  "require(state[owner].flag == true, \"Resource not found\")"
                require_helper_t_stringliteral_d39e6caf1f8c34c707a2a9080eedd88e4333823fa1b23a8e2a9a348004ce9660(expr_118)
                /// @src 0:1818:1819  "a"
                let _18 := var_a_107
                let expr_126 := _18
                /// @src 0:1801:1806  "state"
                let _19 := 0x08
                let expr_122 := _19
                /// @src 0:1807:1812  "owner"
                let _20 := var_owner_109
                let expr_123 := _20
                /// @src 0:1801:1813  "state[owner]"
                let _21 := mapping_index_access_t_mapping$_t_address_$_t_struct$_DroppedRes_$45_storage_$_of_t_address(expr_122,expr_123)
                let _22_slot := _21
                let expr_124_slot := _22_slot
                /// @src 0:1801:1815  "state[owner].a"
                let _23 := add(expr_124_slot, 0)
                /// @src 0:1801:1819  "state[owner].a = a"
                update_storage_value_offset_0t_uint256_to_t_uint256(_23, expr_126)
                let expr_127 := expr_126

            }
            /// @src 0:230:6207  "contract ResourceDroppingV5 is IProtectionLayerProtectorV3 {..."

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

            function cleanup_from_storage_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function read_from_storage_split_offset_0_t_uint256(slot) -> value {
                value := extract_from_storage_value_offset_0t_uint256(sload(slot))

            }

            /// @ast-id 153
            /// @src 0:1832:1995  "function read(address owner) public view returns (uint256) {..."
            function fun_read_153(var_owner_132) -> var__135 {
                /// @src 0:1882:1889  "uint256"
                let zero_t_uint256_24 := zero_value_for_split_t_uint256()
                var__135 := zero_t_uint256_24

                /// @src 0:1909:1914  "state"
                let _25 := 0x08
                let expr_138 := _25
                /// @src 0:1915:1920  "owner"
                let _26 := var_owner_132
                let expr_139 := _26
                /// @src 0:1909:1921  "state[owner]"
                let _27 := mapping_index_access_t_mapping$_t_address_$_t_struct$_DroppedRes_$45_storage_$_of_t_address(expr_138,expr_139)
                let _28_slot := _27
                let expr_140_slot := _28_slot
                /// @src 0:1909:1926  "state[owner].flag"
                let _29 := add(expr_140_slot, 2)
                let _30 := read_from_storage_split_offset_0_t_bool(_29)
                let expr_141 := _30
                /// @src 0:1930:1934  "true"
                let expr_142 := 0x01
                /// @src 0:1909:1934  "state[owner].flag == true"
                let expr_143 := eq(cleanup_t_bool(expr_141), cleanup_t_bool(expr_142))
                /// @src 0:1901:1957  "require(state[owner].flag == true, \"Resource not found\")"
                require_helper_t_stringliteral_d39e6caf1f8c34c707a2a9080eedd88e4333823fa1b23a8e2a9a348004ce9660(expr_143)
                /// @src 0:1974:1979  "state"
                let _31 := 0x08
                let expr_147 := _31
                /// @src 0:1980:1985  "owner"
                let _32 := var_owner_132
                let expr_148 := _32
                /// @src 0:1974:1986  "state[owner]"
                let _33 := mapping_index_access_t_mapping$_t_address_$_t_struct$_DroppedRes_$45_storage_$_of_t_address(expr_147,expr_148)
                let _34_slot := _33
                let expr_149_slot := _34_slot
                /// @src 0:1974:1988  "state[owner].a"
                let _35 := add(expr_149_slot, 0)
                let _36 := read_from_storage_split_offset_0_t_uint256(_35)
                let expr_150 := _36
                /// @src 0:1967:1988  "return state[owner].a"
                var__135 := expr_150
                leave

            }
            /// @src 0:230:6207  "contract ResourceDroppingV5 is IProtectionLayerProtectorV3 {..."

            function shift_left_dynamic(bits, value) -> newValue {
                newValue :=

                shl(bits, value)

            }

            function update_byte_slice_dynamic32(value, shiftBytes, toInsert) -> result {
                let shiftBits := mul(shiftBytes, 8)
                let mask := shift_left_dynamic(shiftBits, 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff)
                toInsert := shift_left_dynamic(shiftBits, toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_storage_value_t_uint256_to_t_uint256(slot, offset, value_0) {
                let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
                sstore(slot, update_byte_slice_dynamic32(sload(slot), offset, prepare_store_t_uint256(convertedValue_0)))
            }

            function storage_set_to_zero_t_uint256(slot, offset) {
                let zero_0 := zero_value_for_split_t_uint256()
                update_storage_value_t_uint256_to_t_uint256(slot, offset, zero_0)
            }

            function clear_struct_storage_t_struct$_DroppedRes_$45_storage(slot) {

                storage_set_to_zero_t_uint256(add(slot, 0), 0)

                storage_set_to_zero_t_uint256(add(slot, 1), 0)

                sstore(add(slot, 2), 0)

            }

            function storage_set_to_zero_t_struct$_DroppedRes_$45_storage(slot, offset) {
                if iszero(eq(offset, 0)) { panic_error_0x00() }
                clear_struct_storage_t_struct$_DroppedRes_$45_storage(slot)
            }

            /// @ast-id 174
            /// @src 0:2001:2141  "function remove(address owner) public {..."
            function fun_remove_174(var_owner_155) {

                /// @src 0:2057:2062  "state"
                let _37 := 0x08
                let expr_159 := _37
                /// @src 0:2063:2068  "owner"
                let _38 := var_owner_155
                let expr_160 := _38
                /// @src 0:2057:2069  "state[owner]"
                let _39 := mapping_index_access_t_mapping$_t_address_$_t_struct$_DroppedRes_$45_storage_$_of_t_address(expr_159,expr_160)
                let _40_slot := _39
                let expr_161_slot := _40_slot
                /// @src 0:2057:2074  "state[owner].flag"
                let _41 := add(expr_161_slot, 2)
                let _42 := read_from_storage_split_offset_0_t_bool(_41)
                let expr_162 := _42
                /// @src 0:2078:2082  "true"
                let expr_163 := 0x01
                /// @src 0:2057:2082  "state[owner].flag == true"
                let expr_164 := eq(cleanup_t_bool(expr_162), cleanup_t_bool(expr_163))
                /// @src 0:2049:2105  "require(state[owner].flag == true, \"Resource not found\")"
                require_helper_t_stringliteral_d39e6caf1f8c34c707a2a9080eedd88e4333823fa1b23a8e2a9a348004ce9660(expr_164)
                /// @src 0:2122:2127  "state"
                let _43 := 0x08
                let expr_168 := _43
                /// @src 0:2128:2133  "owner"
                let _44 := var_owner_155
                let expr_169 := _44
                /// @src 0:2122:2134  "state[owner]"
                let _45 := mapping_index_access_t_mapping$_t_address_$_t_struct$_DroppedRes_$45_storage_$_of_t_address(expr_168,expr_169)
                /// @src 0:2115:2134  "delete state[owner]"
                storage_set_to_zero_t_struct$_DroppedRes_$45_storage(_45, 0)

            }
            /// @src 0:230:6207  "contract ResourceDroppingV5 is IProtectionLayerProtectorV3 {..."

            /// @ast-id 191
            /// @src 0:2284:2396  "function sink(uint256 resId) external {..."
            function fun_sink_191(var_resId_176) {

                /// @src 0:2362:2367  "resId"
                let _46 := var_resId_176
                let expr_183 := _46
                /// @src 0:2356:2368  "resIn(resId)"
                let expr_184_mpos := fun_resIn_437(expr_183)
                /// @src 0:2332:2368  "DroppedRes memory res = resIn(resId)"
                let var_res_181_mpos := expr_184_mpos
                /// @src 0:2385:2388  "res"
                let _47_mpos := var_res_181_mpos
                let expr_187_mpos := _47_mpos
                fun_unpack_682(expr_187_mpos)

            }
            /// @src 0:230:6207  "contract ResourceDroppingV5 is IProtectionLayerProtectorV3 {..."

            function cleanup_t_rational_14_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_14_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_14_by_1(value)))
            }

            function cleanup_t_rational_44_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_44_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_44_by_1(value)))
            }

            /// @ast-id 210
            /// @src 0:2402:2542  "function dropRes() external returns (uint256) {..."
            function fun_dropRes_210() -> var__194 {
                /// @src 0:2439:2446  "uint256"
                let zero_t_uint256_48 := zero_value_for_split_t_uint256()
                var__194 := zero_t_uint256_48

                /// @src 0:2493:2495  "14"
                let expr_200 := 0x0e
                /// @src 0:2497:2499  "44"
                let expr_201 := 0x2c
                /// @src 0:2501:2506  "false"
                let expr_202 := 0x00
                /// @src 0:2482:2507  "DroppedRes(14, 44, false)"
                let expr_203_mpos := allocate_memory_struct_t_struct$_DroppedRes_$45_storage_ptr()
                let _49 := convert_t_rational_14_by_1_to_t_uint256(expr_200)
                write_to_memory_t_uint256(add(expr_203_mpos, 0), _49)
                let _50 := convert_t_rational_44_by_1_to_t_uint256(expr_201)
                write_to_memory_t_uint256(add(expr_203_mpos, 32), _50)
                write_to_memory_t_bool(add(expr_203_mpos, 64), expr_202)
                /// @src 0:2458:2507  "DroppedRes memory res = DroppedRes(14, 44, false)"
                let var_res_198_mpos := expr_203_mpos
                /// @src 0:2531:2534  "res"
                let _51_mpos := var_res_198_mpos
                let expr_206_mpos := _51_mpos
                /// @src 0:2524:2535  "resOut(res)"
                let expr_207 := fun_resOut_480(expr_206_mpos)
                /// @src 0:2517:2535  "return resOut(res)"
                var__194 := expr_207
                leave

            }
            /// @src 0:230:6207  "contract ResourceDroppingV5 is IProtectionLayerProtectorV3 {..."

            function allocate_memory_struct_t_struct$_DroppedRes_$45_memory_ptr() -> memPtr {
                memPtr := allocate_memory(96)
            }

            function read_from_storage_reference_type_t_struct$_DroppedRes_$45_memory_ptr(slot) -> value {
                value := allocate_memory_struct_t_struct$_DroppedRes_$45_memory_ptr()

                {
                    let memberValue_0 := read_from_storage_split_offset_0_t_uint256(add(slot, 0))
                    write_to_memory_t_uint256(add(value, 0), memberValue_0)
                }

                {
                    let memberValue_0 := read_from_storage_split_offset_0_t_uint256(add(slot, 1))
                    write_to_memory_t_uint256(add(value, 32), memberValue_0)
                }

                {
                    let memberValue_0 := read_from_storage_split_offset_0_t_bool(add(slot, 2))
                    write_to_memory_t_bool(add(value, 64), memberValue_0)
                }

            }

            function convert_t_struct$_DroppedRes_$45_storage_to_t_struct$_DroppedRes_$45_memory_ptr(value) -> converted {

                converted := read_from_storage_reference_type_t_struct$_DroppedRes_$45_memory_ptr(value)

            }

            /// @ast-id 244
            /// @src 0:2548:2794  "function dropResFromStorage(address owner) external returns (uint256) {..."
            function fun_dropResFromStorage_244(var_owner_212) -> var__215 {
                /// @src 0:2609:2616  "uint256"
                let zero_t_uint256_52 := zero_value_for_split_t_uint256()
                var__215 := zero_t_uint256_52

                /// @src 0:2636:2641  "state"
                let _53 := 0x08
                let expr_218 := _53
                /// @src 0:2642:2647  "owner"
                let _54 := var_owner_212
                let expr_219 := _54
                /// @src 0:2636:2648  "state[owner]"
                let _55 := mapping_index_access_t_mapping$_t_address_$_t_struct$_DroppedRes_$45_storage_$_of_t_address(expr_218,expr_219)
                let _56_slot := _55
                let expr_220_slot := _56_slot
                /// @src 0:2636:2653  "state[owner].flag"
                let _57 := add(expr_220_slot, 2)
                let _58 := read_from_storage_split_offset_0_t_bool(_57)
                let expr_221 := _58
                /// @src 0:2657:2661  "true"
                let expr_222 := 0x01
                /// @src 0:2636:2661  "state[owner].flag == true"
                let expr_223 := eq(cleanup_t_bool(expr_221), cleanup_t_bool(expr_222))
                /// @src 0:2628:2684  "require(state[owner].flag == true, \"Resource not found\")"
                require_helper_t_stringliteral_d39e6caf1f8c34c707a2a9080eedd88e4333823fa1b23a8e2a9a348004ce9660(expr_223)
                /// @src 0:2718:2723  "state"
                let _59 := 0x08
                let expr_230 := _59
                /// @src 0:2724:2729  "owner"
                let _60 := var_owner_212
                let expr_231 := _60
                /// @src 0:2718:2730  "state[owner]"
                let _61 := mapping_index_access_t_mapping$_t_address_$_t_struct$_DroppedRes_$45_storage_$_of_t_address(expr_230,expr_231)
                let _62_slot := _61
                let expr_232_slot := _62_slot
                /// @src 0:2694:2730  "DroppedRes memory res = state[owner]"
                let var_res_229_mpos := convert_t_struct$_DroppedRes_$45_storage_to_t_struct$_DroppedRes_$45_memory_ptr(expr_232_slot)
                /// @src 0:2747:2752  "state"
                let _63 := 0x08
                let expr_234 := _63
                /// @src 0:2753:2758  "owner"
                let _64 := var_owner_212
                let expr_235 := _64
                /// @src 0:2747:2759  "state[owner]"
                let _65 := mapping_index_access_t_mapping$_t_address_$_t_struct$_DroppedRes_$45_storage_$_of_t_address(expr_234,expr_235)
                /// @src 0:2740:2759  "delete state[owner]"
                storage_set_to_zero_t_struct$_DroppedRes_$45_storage(_65, 0)
                /// @src 0:2783:2786  "res"
                let _66_mpos := var_res_229_mpos
                let expr_240_mpos := _66_mpos
                /// @src 0:2776:2787  "resOut(res)"
                let expr_241 := fun_resOut_480(expr_240_mpos)
                /// @src 0:2769:2787  "return resOut(res)"
                var__215 := expr_241
                leave

            }
            /// @src 0:230:6207  "contract ResourceDroppingV5 is IProtectionLayerProtectorV3 {..."

            /// @ast-id 254
            /// @src 0:2800:2894  "function storeExternalResource(uint256 resRef) external {..."
            function fun_storeExternalResource_254(var_resRef_246) {

                /// @src 0:2880:2886  "resRef"
                let _67 := var_resRef_246
                let expr_250 := _67
                fun_storeExternal_566(expr_250)

            }
            /// @src 0:230:6207  "contract ResourceDroppingV5 is IProtectionLayerProtectorV3 {..."

            /// @ast-id 264
            /// @src 0:2900:2998  "function unstoreExternalResource(uint256 resRef) external {..."
            function fun_unstoreExternalResource_264(var_resRef_256) {

                /// @src 0:2984:2990  "resRef"
                let _68 := var_resRef_256
                let expr_260 := _68
                fun_unstoreExternal_675(expr_260)

            }
            /// @src 0:230:6207  "contract ResourceDroppingV5 is IProtectionLayerProtectorV3 {..."

            function zero_value_for_split_t_bool() -> ret {
                ret := 0
            }

            function panic_error_0x01() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x01)
                revert(0, 0x24)
            }

            function assert_helper(condition) {
                if iszero(condition) { panic_error_0x01() }
            }

            function cleanup_t_rational_0_by_1(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_0_by_1_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(identity(cleanup_t_rational_0_by_1(value)))
            }

            function convert_t_rational_0_by_1_to_t_address(value) -> converted {
                converted := convert_t_rational_0_by_1_to_t_uint160(value)
            }

            function shift_left_8(value) -> newValue {
                newValue :=

                shl(8, value)

            }

            function update_byte_slice_20_shift_1(value, toInsert) -> result {
                let mask := 0xffffffffffffffffffffffffffffffffffffffff00
                toInsert := shift_left_8(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function prepare_store_t_address(value) -> ret {
                ret := value
            }

            function update_storage_value_offset_1t_address_to_t_address(slot, value_0) {
                let convertedValue_0 := convert_t_address_to_t_address(value_0)
                sstore(slot, update_byte_slice_20_shift_1(sload(slot), prepare_store_t_address(convertedValue_0)))
            }

            function update_byte_slice_20_shift_0(value, toInsert) -> result {
                let mask := 0xffffffffffffffffffffffffffffffffffffffff
                toInsert := shift_left_0(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_storage_value_offset_0t_address_to_t_address(slot, value_0) {
                let convertedValue_0 := convert_t_address_to_t_address(value_0)
                sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address(convertedValue_0)))
            }

            function shift_right_8_unsigned(value) -> newValue {
                newValue :=

                shr(8, value)

            }

            function cleanup_from_storage_t_address(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function extract_from_storage_value_offset_1t_address(slot_value) -> value {
                value := cleanup_from_storage_t_address(shift_right_8_unsigned(slot_value))
            }

            function read_from_storage_split_offset_1_t_address(slot) -> value {
                value := extract_from_storage_value_offset_1t_address(sload(slot))

            }

            function allocate_memory_array_t_bytes_memory_ptr(length) -> memPtr {
                let allocSize := array_allocation_size_t_bytes_memory_ptr(length)
                memPtr := allocate_memory(allocSize)

                mstore(memPtr, length)

            }

            function zero_value_for_split_t_bytes_memory_ptr() -> ret {
                ret := 96
            }

            function extract_returndata() -> data {

                switch returndatasize()
                case 0 {
                    data := zero_value_for_split_t_bytes_memory_ptr()
                }
                default {
                    data := allocate_memory_array_t_bytes_memory_ptr(returndatasize())
                    returndatacopy(add(data, 0x20), 0, returndatasize())
                }

            }

            function update_byte_slice_dynamic20(value, shiftBytes, toInsert) -> result {
                let shiftBits := mul(shiftBytes, 8)
                let mask := shift_left_dynamic(shiftBits, 0xffffffffffffffffffffffffffffffffffffffff)
                toInsert := shift_left_dynamic(shiftBits, toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_storage_value_t_address_to_t_address(slot, offset, value_0) {
                let convertedValue_0 := convert_t_address_to_t_address(value_0)
                sstore(slot, update_byte_slice_dynamic20(sload(slot), offset, prepare_store_t_address(convertedValue_0)))
            }

            function zero_value_for_split_t_address() -> ret {
                ret := 0
            }

            function storage_set_to_zero_t_address(slot, offset) {
                let zero_0 := zero_value_for_split_t_address()
                update_storage_value_t_address_to_t_address(slot, offset, zero_0)
            }

            /// @ast-id 375
            /// @src 0:3453:4125  "function protect(..."
            function fun_protect_375(var__protected_contract_311, var_callback_313_mpos) -> var__316 {
                /// @src 0:3562:3566  "bool"
                let zero_t_bool_69 := zero_value_for_split_t_bool()
                var__316 := zero_t_bool_69

                /// @src 0:3585:3589  "flag"
                let _70 := read_from_storage_split_offset_0_t_bool(0x06)
                let expr_319 := _70
                /// @src 0:3593:3598  "false"
                let expr_320 := 0x00
                /// @src 0:3585:3598  "flag == false"
                let expr_321 := eq(cleanup_t_bool(expr_319), cleanup_t_bool(expr_320))
                /// @src 0:3578:3599  "assert(flag == false)"
                assert_helper(expr_321)
                /// @src 0:3660:3679  "_protected_contract"
                let _71 := var__protected_contract_311
                let expr_325 := _71
                /// @src 0:3691:3692  "0"
                let expr_328 := 0x00
                /// @src 0:3683:3693  "address(0)"
                let expr_329 := convert_t_rational_0_by_1_to_t_address(expr_328)
                /// @src 0:3660:3693  "_protected_contract != address(0)"
                let expr_330 := iszero(eq(cleanup_t_address(expr_325), cleanup_t_address(expr_329)))
                /// @src 0:3653:3694  "assert(_protected_contract != address(0))"
                assert_helper(expr_330)
                /// @src 0:3755:3759  "true"
                let expr_334 := 0x01
                /// @src 0:3748:3759  "flag = true"
                update_storage_value_offset_0t_bool_to_t_bool(0x06, expr_334)
                let expr_335 := expr_334
                /// @src 0:3790:3809  "_protected_contract"
                let _72 := var__protected_contract_311
                let expr_338 := _72
                /// @src 0:3769:3809  "protected_contract = _protected_contract"
                update_storage_value_offset_1t_address_to_t_address(0x06, expr_338)
                let expr_339 := expr_338
                /// @src 0:3828:3838  "msg.sender"
                let expr_343 := caller()
                /// @src 0:3819:3838  "signer = msg.sender"
                update_storage_value_offset_0t_address_to_t_address(0x07, expr_343)
                let expr_344 := expr_343
                /// @src 0:3867:3885  "protected_contract"
                let _73 := read_from_storage_split_offset_1_t_address(0x06)
                let expr_348 := _73
                /// @src 0:3867:3890  "protected_contract.call"
                let expr_349_address := expr_348
                /// @src 0:3891:3899  "callback"
                let _74_mpos := var_callback_313_mpos
                let expr_350_mpos := _74_mpos
                /// @src 0:3867:3900  "protected_contract.call(callback)"

                let _75 := add(expr_350_mpos, 0x20)
                let _76 := mload(expr_350_mpos)

                let expr_351_component_1 := call(gas(), expr_349_address,  0,  _75, _76, 0, 0)
                let expr_351_component_2_mpos := extract_returndata()
                /// @src 0:3848:3900  "(bool success, ) = protected_contract.call(callback)"
                let var_success_347 := expr_351_component_1
                /// @src 0:3917:3924  "success"
                let _77 := var_success_347
                let expr_354 := _77
                /// @src 0:3910:3925  "assert(success)"
                assert_helper(expr_354)
                /// @src 0:3966:3971  "false"
                let expr_358 := 0x00
                /// @src 0:3959:3971  "flag = false"
                update_storage_value_offset_0t_bool_to_t_bool(0x06, expr_358)
                let expr_359 := expr_358
                /// @src 0:3981:4006  "delete protected_contract"
                storage_set_to_zero_t_address(0x06, 1)
                /// @src 0:4016:4029  "delete signer"
                storage_set_to_zero_t_address(0x07, 0)
                /// @src 0:4046:4056  "validate()"
                let expr_369 := fun_validate_309()
                /// @src 0:4039:4057  "assert(validate())"
                assert_helper(expr_369)
                /// @src 0:4114:4118  "true"
                let expr_372 := 0x01
                /// @src 0:4107:4118  "return true"
                var__316 := expr_372
                leave

            }
            /// @src 0:230:6207  "contract ResourceDroppingV5 is IProtectionLayerProtectorV3 {..."

            function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(identity(cleanup_t_rational_0_by_1(value)))
            }

            function extract_from_storage_value_offset_0t_address(slot_value) -> value {
                value := cleanup_from_storage_t_address(shift_right_0_unsigned(slot_value))
            }

            function read_from_storage_split_offset_0_t_address(slot) -> value {
                value := extract_from_storage_value_offset_0t_address(sload(slot))

            }

            /// @ast-id 309
            /// @src 0:3051:3447  "function validate() internal view returns (bool) {..."
            function fun_validate_309() -> var__267 {
                /// @src 0:3094:3098  "bool"
                let zero_t_bool_78 := zero_value_for_split_t_bool()
                var__267 := zero_t_bool_78

                /// @src 0:3117:3121  "flag"
                let _79 := read_from_storage_split_offset_0_t_bool(0x06)
                let expr_270 := _79
                /// @src 0:3125:3130  "false"
                let expr_271 := 0x00
                /// @src 0:3117:3130  "flag == false"
                let expr_272 := eq(cleanup_t_bool(expr_270), cleanup_t_bool(expr_271))
                /// @src 0:3110:3131  "assert(flag == false)"
                assert_helper(expr_272)
                /// @src 0:3190:3197  "sizeOfH"
                let _80 := read_from_storage_split_offset_0_t_uint256(0x02)
                let expr_276 := _80
                /// @src 0:3201:3208  "sizeOfT"
                let _81 := read_from_storage_split_offset_0_t_uint256(0x04)
                let expr_277 := _81
                /// @src 0:3190:3208  "sizeOfH == sizeOfT"
                let expr_278 := eq(cleanup_t_uint256(expr_276), cleanup_t_uint256(expr_277))
                /// @src 0:3190:3224  "sizeOfH == sizeOfT && sizeOfH == 0"
                let expr_282 := expr_278
                if expr_282 {
                    /// @src 0:3212:3219  "sizeOfH"
                    let _82 := read_from_storage_split_offset_0_t_uint256(0x02)
                    let expr_279 := _82
                    /// @src 0:3223:3224  "0"
                    let expr_280 := 0x00
                    /// @src 0:3212:3224  "sizeOfH == 0"
                    let expr_281 := eq(cleanup_t_uint256(expr_279), convert_t_rational_0_by_1_to_t_uint256(expr_280))
                    /// @src 0:3190:3224  "sizeOfH == sizeOfT && sizeOfH == 0"
                    expr_282 := expr_281
                }
                /// @src 0:3183:3225  "assert(sizeOfH == sizeOfT && sizeOfH == 0)"
                assert_helper(expr_282)
                /// @src 0:3294:3312  "protected_contract"
                let _83 := read_from_storage_split_offset_1_t_address(0x06)
                let expr_288 := _83
                /// @src 0:3286:3313  "address(protected_contract)"
                let expr_289 := expr_288
                /// @src 0:3325:3326  "0"
                let expr_292 := 0x00
                /// @src 0:3317:3327  "address(0)"
                let expr_293 := convert_t_rational_0_by_1_to_t_address(expr_292)
                /// @src 0:3286:3327  "address(protected_contract) == address(0)"
                let expr_294 := eq(cleanup_t_address(expr_289), cleanup_t_address(expr_293))
                /// @src 0:3279:3328  "assert(address(protected_contract) == address(0))"
                assert_helper(expr_294)
                /// @src 0:3370:3376  "signer"
                let _84 := read_from_storage_split_offset_0_t_address(0x07)
                let expr_298 := _84
                /// @src 0:3388:3389  "0"
                let expr_301 := 0x00
                /// @src 0:3380:3390  "address(0)"
                let expr_302 := convert_t_rational_0_by_1_to_t_address(expr_301)
                /// @src 0:3370:3390  "signer == address(0)"
                let expr_303 := eq(cleanup_t_address(expr_298), cleanup_t_address(expr_302))
                /// @src 0:3363:3391  "assert(signer == address(0))"
                assert_helper(expr_303)
                /// @src 0:3436:3440  "true"
                let expr_306 := 0x01
                /// @src 0:3429:3440  "return true"
                var__267 := expr_306
                leave

            }
            /// @src 0:230:6207  "contract ResourceDroppingV5 is IProtectionLayerProtectorV3 {..."

            /// @ast-id 383
            /// @src 0:4131:4209  "function isProtected() public view returns (bool) {..."
            function fun_isProtected_383() -> var__378 {
                /// @src 0:4175:4179  "bool"
                let zero_t_bool_85 := zero_value_for_split_t_bool()
                var__378 := zero_t_bool_85

                /// @src 0:4198:4202  "flag"
                let _86 := read_from_storage_split_offset_0_t_bool(0x06)
                let expr_380 := _86
                /// @src 0:4191:4202  "return flag"
                var__378 := expr_380
                leave

            }
            /// @src 0:230:6207  "contract ResourceDroppingV5 is IProtectionLayerProtectorV3 {..."

            function zero_value_for_t_uint256() -> ret {
                ret := 0
            }

            function zero_value_for_t_bool() -> ret {
                ret := 0
            }

            function allocate_and_zero_memory_struct_t_struct$_DroppedRes_$45_memory_ptr() -> memPtr {
                memPtr := allocate_memory_struct_t_struct$_DroppedRes_$45_memory_ptr()
                let offset := memPtr

                mstore(offset, zero_value_for_t_uint256())
                offset := add(offset, 32)

                mstore(offset, zero_value_for_t_uint256())
                offset := add(offset, 32)

                mstore(offset, zero_value_for_t_bool())
                offset := add(offset, 32)

            }

            function zero_value_for_split_t_struct$_DroppedRes_$45_memory_ptr() -> ret {
                ret := allocate_and_zero_memory_struct_t_struct$_DroppedRes_$45_memory_ptr()
            }

            function mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_uint256_$_t_enum$_Type_$8_$_$_of_t_address(slot , key) -> dataSlot {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function mapping_index_access_t_mapping$_t_uint256_$_t_enum$_Type_$8_$_of_t_uint256(slot , key) -> dataSlot {
                mstore(0, convert_t_uint256_to_t_uint256(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function cleanup_from_storage_t_enum$_Type_$8(value) -> cleaned {
                cleaned := and(value, 0xff)
            }

            function extract_from_storage_value_offset_0t_enum$_Type_$8(slot_value) -> value {
                value := cleanup_from_storage_t_enum$_Type_$8(shift_right_0_unsigned(slot_value))
            }

            function read_from_storage_split_offset_0_t_enum$_Type_$8(slot) -> value {
                value := extract_from_storage_value_offset_0t_enum$_Type_$8(sload(slot))

            }

            function panic_error_0x21() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x21)
                revert(0, 0x24)
            }

            function validator_assert_t_enum$_Type_$8(value) {
                if iszero(lt(value, 2)) { panic_error_0x21() }
            }

            function cleanup_t_enum$_Type_$8(value) -> cleaned {
                cleaned := value validator_assert_t_enum$_Type_$8(value)
            }

            function mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_uint256_$_t_struct$_DroppedRes_$45_storage_$_$_of_t_address(slot , key) -> dataSlot {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function mapping_index_access_t_mapping$_t_uint256_$_t_struct$_DroppedRes_$45_storage_$_of_t_uint256(slot , key) -> dataSlot {
                mstore(0, convert_t_uint256_to_t_uint256(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function update_byte_slice_dynamic1(value, shiftBytes, toInsert) -> result {
                let shiftBits := mul(shiftBytes, 8)
                let mask := shift_left_dynamic(shiftBits, 255)
                toInsert := shift_left_dynamic(shiftBits, toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function convert_t_enum$_Type_$8_to_t_enum$_Type_$8(value) -> converted {
                converted := cleanup_t_enum$_Type_$8(value)
            }

            function prepare_store_t_enum$_Type_$8(value) -> ret {
                ret := value
            }

            function update_storage_value_t_enum$_Type_$8_to_t_enum$_Type_$8(slot, offset, value_0) {
                let convertedValue_0 := convert_t_enum$_Type_$8_to_t_enum$_Type_$8(value_0)
                sstore(slot, update_byte_slice_dynamic1(sload(slot), offset, prepare_store_t_enum$_Type_$8(convertedValue_0)))
            }

            function zero_value_for_split_t_enum$_Type_$8() -> ret {
                ret := 0
            }

            function storage_set_to_zero_t_enum$_Type_$8(slot, offset) {
                let zero_0 := zero_value_for_split_t_enum$_Type_$8()
                update_storage_value_t_enum$_Type_$8_to_t_enum$_Type_$8(slot, offset, zero_0)
            }

            function panic_error_0x11() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x11)
                revert(0, 0x24)
            }

            function decrement_t_uint256(value) -> ret {
                value := cleanup_t_uint256(value)
                if eq(value, 0x00) { panic_error_0x11() }
                ret := sub(value, 1)
            }

            /// @ast-id 437
            /// @src 0:4215:4569  "function resIn(uint256 resId) private returns (DroppedRes memory res) {..."
            function fun_resIn_437(var_resId_385) -> var_res_389_mpos {
                /// @src 0:4262:4283  "DroppedRes memory res"
                let zero_t_struct$_DroppedRes_$45_memory_ptr_87_mpos := zero_value_for_split_t_struct$_DroppedRes_$45_memory_ptr()
                var_res_389_mpos := zero_t_struct$_DroppedRes_$45_memory_ptr_87_mpos

                /// @src 0:4302:4306  "flag"
                let _88 := read_from_storage_split_offset_0_t_bool(0x06)
                let expr_392 := _88
                /// @src 0:4310:4314  "true"
                let expr_393 := 0x01
                /// @src 0:4302:4314  "flag == true"
                let expr_394 := eq(cleanup_t_bool(expr_392), cleanup_t_bool(expr_393))
                /// @src 0:4295:4315  "assert(flag == true)"
                assert_helper(expr_394)
                /// @src 0:4369:4370  "H"
                let _89 := 0x01
                let expr_398 := _89
                /// @src 0:4371:4377  "signer"
                let _90 := read_from_storage_split_offset_0_t_address(0x07)
                let expr_399 := _90
                /// @src 0:4369:4378  "H[signer]"
                let _91 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_uint256_$_t_enum$_Type_$8_$_$_of_t_address(expr_398,expr_399)
                let _92 := _91
                let expr_400 := _92
                /// @src 0:4379:4384  "resId"
                let _93 := var_resId_385
                let expr_401 := _93
                /// @src 0:4369:4385  "H[signer][resId]"
                let _94 := mapping_index_access_t_mapping$_t_uint256_$_t_enum$_Type_$8_$_of_t_uint256(expr_400,expr_401)
                let _95 := read_from_storage_split_offset_0_t_enum$_Type_$8(_94)
                let expr_402 := _95
                /// @src 0:4389:4397  "Type.res"
                let expr_404 := 1
                /// @src 0:4369:4397  "H[signer][resId] == Type.res"
                let expr_405 := eq(cleanup_t_enum$_Type_$8(expr_402), cleanup_t_enum$_Type_$8(expr_404))
                /// @src 0:4362:4398  "assert(H[signer][resId] == Type.res)"
                assert_helper(expr_405)
                /// @src 0:4442:4443  "T"
                let _96 := 0x03
                let expr_409 := _96
                /// @src 0:4444:4450  "signer"
                let _97 := read_from_storage_split_offset_0_t_address(0x07)
                let expr_410 := _97
                /// @src 0:4442:4451  "T[signer]"
                let _98 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_uint256_$_t_struct$_DroppedRes_$45_storage_$_$_of_t_address(expr_409,expr_410)
                let _99 := _98
                let expr_411 := _99
                /// @src 0:4452:4457  "resId"
                let _100 := var_resId_385
                let expr_412 := _100
                /// @src 0:4442:4458  "T[signer][resId]"
                let _101 := mapping_index_access_t_mapping$_t_uint256_$_t_struct$_DroppedRes_$45_storage_$_of_t_uint256(expr_411,expr_412)
                let _102_slot := _101
                let expr_413_slot := _102_slot
                /// @src 0:4436:4458  "res = T[signer][resId]"
                var_res_389_mpos := convert_t_struct$_DroppedRes_$45_storage_to_t_struct$_DroppedRes_$45_memory_ptr(expr_413_slot)
                let _103_mpos := var_res_389_mpos
                let expr_414_mpos := _103_mpos
                /// @src 0:4475:4476  "H"
                let _104 := 0x01
                let expr_416 := _104
                /// @src 0:4477:4483  "signer"
                let _105 := read_from_storage_split_offset_0_t_address(0x07)
                let expr_417 := _105
                /// @src 0:4475:4484  "H[signer]"
                let _106 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_uint256_$_t_enum$_Type_$8_$_$_of_t_address(expr_416,expr_417)
                let _107 := _106
                let expr_418 := _107
                /// @src 0:4485:4490  "resId"
                let _108 := var_resId_385
                let expr_419 := _108
                /// @src 0:4475:4491  "H[signer][resId]"
                let _109 := mapping_index_access_t_mapping$_t_uint256_$_t_enum$_Type_$8_$_of_t_uint256(expr_418,expr_419)
                /// @src 0:4468:4491  "delete H[signer][resId]"
                storage_set_to_zero_t_enum$_Type_$8(_109, 0)
                /// @src 0:4501:4510  "sizeOfH--"
                let _111 := read_from_storage_split_offset_0_t_uint256(0x02)
                let _110 := decrement_t_uint256(_111)
                update_storage_value_offset_0t_uint256_to_t_uint256(0x02, _110)
                let expr_424 := _111
                /// @src 0:4527:4528  "T"
                let _112 := 0x03
                let expr_426 := _112
                /// @src 0:4529:4535  "signer"
                let _113 := read_from_storage_split_offset_0_t_address(0x07)
                let expr_427 := _113
                /// @src 0:4527:4536  "T[signer]"
                let _114 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_uint256_$_t_struct$_DroppedRes_$45_storage_$_$_of_t_address(expr_426,expr_427)
                let _115 := _114
                let expr_428 := _115
                /// @src 0:4537:4542  "resId"
                let _116 := var_resId_385
                let expr_429 := _116
                /// @src 0:4527:4543  "T[signer][resId]"
                let _117 := mapping_index_access_t_mapping$_t_uint256_$_t_struct$_DroppedRes_$45_storage_$_of_t_uint256(expr_428,expr_429)
                /// @src 0:4520:4543  "delete T[signer][resId]"
                storage_set_to_zero_t_struct$_DroppedRes_$45_storage(_117, 0)
                /// @src 0:4553:4562  "sizeOfT--"
                let _119 := read_from_storage_split_offset_0_t_uint256(0x04)
                let _118 := decrement_t_uint256(_119)
                update_storage_value_offset_0t_uint256_to_t_uint256(0x04, _118)
                let expr_434 := _119

            }
            /// @src 0:230:6207  "contract ResourceDroppingV5 is IProtectionLayerProtectorV3 {..."

            function increment_t_uint256(value) -> ret {
                value := cleanup_t_uint256(value)
                if eq(value, 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) { panic_error_0x11() }
                ret := add(value, 1)
            }

            function update_storage_value_offset_0t_enum$_Type_$8_to_t_enum$_Type_$8(slot, value_0) {
                let convertedValue_0 := convert_t_enum$_Type_$8_to_t_enum$_Type_$8(value_0)
                sstore(slot, update_byte_slice_1_shift_0(sload(slot), prepare_store_t_enum$_Type_$8(convertedValue_0)))
            }

            /// @ast-id 480
            /// @src 0:4575:4848  "function resOut(DroppedRes memory res) private returns (uint256) {..."
            function fun_resOut_480(var_res_440_mpos) -> var__443 {
                /// @src 0:4631:4638  "uint256"
                let zero_t_uint256_120 := zero_value_for_split_t_uint256()
                var__443 := zero_t_uint256_120

                /// @src 0:4657:4661  "flag"
                let _121 := read_from_storage_split_offset_0_t_bool(0x06)
                let expr_446 := _121
                /// @src 0:4665:4669  "true"
                let expr_447 := 0x01
                /// @src 0:4657:4669  "flag == true"
                let expr_448 := eq(cleanup_t_bool(expr_446), cleanup_t_bool(expr_447))
                /// @src 0:4650:4670  "assert(flag == true)"
                assert_helper(expr_448)
                /// @src 0:4717:4721  "id++"
                let _123 := read_from_storage_split_offset_0_t_uint256(0x00)
                let _122 := increment_t_uint256(_123)
                update_storage_value_offset_0t_uint256_to_t_uint256(0x00, _122)
                let expr_452 := _123
                /// @src 0:4731:4740  "sizeOfH++"
                let _125 := read_from_storage_split_offset_0_t_uint256(0x02)
                let _124 := increment_t_uint256(_125)
                update_storage_value_offset_0t_uint256_to_t_uint256(0x02, _124)
                let expr_455 := _125
                /// @src 0:4766:4774  "Type.res"
                let expr_463 := 1
                /// @src 0:4750:4751  "H"
                let _126 := 0x01
                let expr_457 := _126
                /// @src 0:4752:4758  "signer"
                let _127 := read_from_storage_split_offset_0_t_address(0x07)
                let expr_458 := _127
                /// @src 0:4750:4759  "H[signer]"
                let _128 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_uint256_$_t_enum$_Type_$8_$_$_of_t_address(expr_457,expr_458)
                let _129 := _128
                let expr_460 := _129
                /// @src 0:4760:4762  "id"
                let _130 := read_from_storage_split_offset_0_t_uint256(0x00)
                let expr_459 := _130
                /// @src 0:4750:4763  "H[signer][id]"
                let _131 := mapping_index_access_t_mapping$_t_uint256_$_t_enum$_Type_$8_$_of_t_uint256(expr_460,expr_459)
                /// @src 0:4750:4774  "H[signer][id] = Type.res"
                update_storage_value_offset_0t_enum$_Type_$8_to_t_enum$_Type_$8(_131, expr_463)
                let expr_464 := expr_463
                /// @src 0:4784:4793  "sizeOfT++"
                let _133 := read_from_storage_split_offset_0_t_uint256(0x04)
                let _132 := increment_t_uint256(_133)
                update_storage_value_offset_0t_uint256_to_t_uint256(0x04, _132)
                let expr_467 := _133
                /// @src 0:4819:4822  "res"
                let _134_mpos := var_res_440_mpos
                let expr_474_mpos := _134_mpos
                /// @src 0:4803:4804  "T"
                let _135 := 0x03
                let expr_469 := _135
                /// @src 0:4805:4811  "signer"
                let _136 := read_from_storage_split_offset_0_t_address(0x07)
                let expr_470 := _136
                /// @src 0:4803:4812  "T[signer]"
                let _137 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_uint256_$_t_struct$_DroppedRes_$45_storage_$_$_of_t_address(expr_469,expr_470)
                let _138 := _137
                let expr_472 := _138
                /// @src 0:4813:4815  "id"
                let _139 := read_from_storage_split_offset_0_t_uint256(0x00)
                let expr_471 := _139
                /// @src 0:4803:4816  "T[signer][id]"
                let _140 := mapping_index_access_t_mapping$_t_uint256_$_t_struct$_DroppedRes_$45_storage_$_of_t_uint256(expr_472,expr_471)
                /// @src 0:4803:4822  "T[signer][id] = res"
                update_storage_value_offset_0t_struct$_DroppedRes_$45_memory_ptr_to_t_struct$_DroppedRes_$45_storage(_140, expr_474_mpos)
                let _141_slot := _140
                let expr_475_slot := _141_slot
                /// @src 0:4839:4841  "id"
                let _142 := read_from_storage_split_offset_0_t_uint256(0x00)
                let expr_477 := _142
                /// @src 0:4832:4841  "return id"
                var__443 := expr_477
                leave

            }
            /// @src 0:230:6207  "contract ResourceDroppingV5 is IProtectionLayerProtectorV3 {..."

            function store_literal_in_memory_11fc13e0488c30e2cff22c9f1fa86759e037424cac4c981f07eb590a95f7a419(memPtr) {

                mstore(add(memPtr, 0), "Invalid resource")

            }

            function abi_encode_t_stringliteral_11fc13e0488c30e2cff22c9f1fa86759e037424cac4c981f07eb590a95f7a419_to_t_string_memory_ptr_fromStack(pos) -> end {
                pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 16)
                store_literal_in_memory_11fc13e0488c30e2cff22c9f1fa86759e037424cac4c981f07eb590a95f7a419(pos)
                end := add(pos, 32)
            }

            function abi_encode_tuple_t_stringliteral_11fc13e0488c30e2cff22c9f1fa86759e037424cac4c981f07eb590a95f7a419__to_t_string_memory_ptr__fromStack(headStart ) -> tail {
                tail := add(headStart, 32)

                mstore(add(headStart, 0), sub(tail, headStart))
                tail := abi_encode_t_stringliteral_11fc13e0488c30e2cff22c9f1fa86759e037424cac4c981f07eb590a95f7a419_to_t_string_memory_ptr_fromStack( tail)

            }

            function require_helper_t_stringliteral_11fc13e0488c30e2cff22c9f1fa86759e037424cac4c981f07eb590a95f7a419(condition ) {
                if iszero(condition) {
                    let memPtr := allocate_unbounded()
                    mstore(memPtr, 0x08c379a000000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple_t_stringliteral_11fc13e0488c30e2cff22c9f1fa86759e037424cac4c981f07eb590a95f7a419__to_t_string_memory_ptr__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function store_literal_in_memory_d493b3bba7f5588c5305eb61d3615f8d2eb55bfc8d43ab5c6296ae9095d59821(memPtr) {

                mstore(add(memPtr, 0), "Resource already stored")

            }

            function abi_encode_t_stringliteral_d493b3bba7f5588c5305eb61d3615f8d2eb55bfc8d43ab5c6296ae9095d59821_to_t_string_memory_ptr_fromStack(pos) -> end {
                pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 23)
                store_literal_in_memory_d493b3bba7f5588c5305eb61d3615f8d2eb55bfc8d43ab5c6296ae9095d59821(pos)
                end := add(pos, 32)
            }

            function abi_encode_tuple_t_stringliteral_d493b3bba7f5588c5305eb61d3615f8d2eb55bfc8d43ab5c6296ae9095d59821__to_t_string_memory_ptr__fromStack(headStart ) -> tail {
                tail := add(headStart, 32)

                mstore(add(headStart, 0), sub(tail, headStart))
                tail := abi_encode_t_stringliteral_d493b3bba7f5588c5305eb61d3615f8d2eb55bfc8d43ab5c6296ae9095d59821_to_t_string_memory_ptr_fromStack( tail)

            }

            function require_helper_t_stringliteral_d493b3bba7f5588c5305eb61d3615f8d2eb55bfc8d43ab5c6296ae9095d59821(condition ) {
                if iszero(condition) {
                    let memPtr := allocate_unbounded()
                    mstore(memPtr, 0x08c379a000000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple_t_stringliteral_d493b3bba7f5588c5305eb61d3615f8d2eb55bfc8d43ab5c6296ae9095d59821__to_t_string_memory_ptr__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(slot , key) -> dataSlot {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            /// @ast-id 566
            /// @src 0:4854:5396  "function storeExternal(uint256 resId) private {..."
            function fun_storeExternal_566(var_resId_482) {

                /// @src 0:4917:4921  "flag"
                let _143 := read_from_storage_split_offset_0_t_bool(0x06)
                let expr_486 := _143
                /// @src 0:4925:4929  "true"
                let expr_487 := 0x01
                /// @src 0:4917:4929  "flag == true"
                let expr_488 := eq(cleanup_t_bool(expr_486), cleanup_t_bool(expr_487))
                /// @src 0:4910:4930  "assert(flag == true)"
                assert_helper(expr_488)
                /// @src 0:4984:4985  "H"
                let _144 := 0x01
                let expr_492 := _144
                /// @src 0:4986:4992  "signer"
                let _145 := read_from_storage_split_offset_0_t_address(0x07)
                let expr_493 := _145
                /// @src 0:4984:4993  "H[signer]"
                let _146 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_uint256_$_t_enum$_Type_$8_$_$_of_t_address(expr_492,expr_493)
                let _147 := _146
                let expr_494 := _147
                /// @src 0:4994:4999  "resId"
                let _148 := var_resId_482
                let expr_495 := _148
                /// @src 0:4984:5000  "H[signer][resId]"
                let _149 := mapping_index_access_t_mapping$_t_uint256_$_t_enum$_Type_$8_$_of_t_uint256(expr_494,expr_495)
                let _150 := read_from_storage_split_offset_0_t_enum$_Type_$8(_149)
                let expr_496 := _150
                /// @src 0:5004:5012  "Type.res"
                let expr_498 := 1
                /// @src 0:4984:5012  "H[signer][resId] == Type.res"
                let expr_499 := eq(cleanup_t_enum$_Type_$8(expr_496), cleanup_t_enum$_Type_$8(expr_498))
                /// @src 0:4977:5013  "assert(H[signer][resId] == Type.res)"
                assert_helper(expr_499)
                /// @src 0:5075:5076  "T"
                let _151 := 0x03
                let expr_505 := _151
                /// @src 0:5077:5083  "signer"
                let _152 := read_from_storage_split_offset_0_t_address(0x07)
                let expr_506 := _152
                /// @src 0:5075:5084  "T[signer]"
                let _153 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_uint256_$_t_struct$_DroppedRes_$45_storage_$_$_of_t_address(expr_505,expr_506)
                let _154 := _153
                let expr_507 := _154
                /// @src 0:5085:5090  "resId"
                let _155 := var_resId_482
                let expr_508 := _155
                /// @src 0:5075:5091  "T[signer][resId]"
                let _156 := mapping_index_access_t_mapping$_t_uint256_$_t_struct$_DroppedRes_$45_storage_$_of_t_uint256(expr_507,expr_508)
                let _157_slot := _156
                let expr_509_slot := _157_slot
                /// @src 0:5051:5091  "DroppedRes memory res = T[signer][resId]"
                let var_res_504_mpos := convert_t_struct$_DroppedRes_$45_storage_to_t_struct$_DroppedRes_$45_memory_ptr(expr_509_slot)
                /// @src 0:5109:5112  "res"
                let _158_mpos := var_res_504_mpos
                let expr_512_mpos := _158_mpos
                /// @src 0:5109:5114  "res.a"
                let _159 := add(expr_512_mpos, 0)
                let _160 := read_from_memoryt_uint256(_159)
                let expr_513 := _160
                /// @src 0:5118:5120  "14"
                let expr_514 := 0x0e
                /// @src 0:5109:5120  "res.a == 14"
                let expr_515 := eq(cleanup_t_uint256(expr_513), convert_t_rational_14_by_1_to_t_uint256(expr_514))
                /// @src 0:5101:5141  "require(res.a == 14, \"Invalid resource\")"
                require_helper_t_stringliteral_11fc13e0488c30e2cff22c9f1fa86759e037424cac4c981f07eb590a95f7a419(expr_515)
                /// @src 0:5159:5162  "res"
                let _161_mpos := var_res_504_mpos
                let expr_520_mpos := _161_mpos
                /// @src 0:5159:5167  "res.flag"
                let _162 := add(expr_520_mpos, 64)
                let _163 := read_from_memoryt_bool(_162)
                let expr_521 := _163
                /// @src 0:5171:5176  "false"
                let expr_522 := 0x00
                /// @src 0:5159:5176  "res.flag == false"
                let expr_523 := eq(cleanup_t_bool(expr_521), cleanup_t_bool(expr_522))
                /// @src 0:5151:5204  "require(res.flag == false, \"Resource already stored\")"
                require_helper_t_stringliteral_d493b3bba7f5588c5305eb61d3615f8d2eb55bfc8d43ab5c6296ae9095d59821(expr_523)
                /// @src 0:5225:5229  "true"
                let expr_530 := 0x01
                /// @src 0:5214:5217  "res"
                let _164_mpos := var_res_504_mpos
                let expr_527_mpos := _164_mpos
                /// @src 0:5214:5222  "res.flag"
                let _165 := add(expr_527_mpos, 64)
                /// @src 0:5214:5229  "res.flag = true"
                let _166 := expr_530
                write_to_memory_t_bool(_165, _166)
                let expr_531 := expr_530
                /// @src 0:5246:5247  "H"
                let _167 := 0x01
                let expr_533 := _167
                /// @src 0:5248:5254  "signer"
                let _168 := read_from_storage_split_offset_0_t_address(0x07)
                let expr_534 := _168
                /// @src 0:5246:5255  "H[signer]"
                let _169 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_uint256_$_t_enum$_Type_$8_$_$_of_t_address(expr_533,expr_534)
                let _170 := _169
                let expr_535 := _170
                /// @src 0:5256:5261  "resId"
                let _171 := var_resId_482
                let expr_536 := _171
                /// @src 0:5246:5262  "H[signer][resId]"
                let _172 := mapping_index_access_t_mapping$_t_uint256_$_t_enum$_Type_$8_$_of_t_uint256(expr_535,expr_536)
                /// @src 0:5239:5262  "delete H[signer][resId]"
                storage_set_to_zero_t_enum$_Type_$8(_172, 0)
                /// @src 0:5272:5281  "sizeOfH--"
                let _174 := read_from_storage_split_offset_0_t_uint256(0x02)
                let _173 := decrement_t_uint256(_174)
                update_storage_value_offset_0t_uint256_to_t_uint256(0x02, _173)
                let expr_541 := _174
                /// @src 0:5298:5299  "T"
                let _175 := 0x03
                let expr_543 := _175
                /// @src 0:5300:5306  "signer"
                let _176 := read_from_storage_split_offset_0_t_address(0x07)
                let expr_544 := _176
                /// @src 0:5298:5307  "T[signer]"
                let _177 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_uint256_$_t_struct$_DroppedRes_$45_storage_$_$_of_t_address(expr_543,expr_544)
                let _178 := _177
                let expr_545 := _178
                /// @src 0:5308:5313  "resId"
                let _179 := var_resId_482
                let expr_546 := _179
                /// @src 0:5298:5314  "T[signer][resId]"
                let _180 := mapping_index_access_t_mapping$_t_uint256_$_t_struct$_DroppedRes_$45_storage_$_of_t_uint256(expr_545,expr_546)
                /// @src 0:5291:5314  "delete T[signer][resId]"
                storage_set_to_zero_t_struct$_DroppedRes_$45_storage(_180, 0)
                /// @src 0:5324:5333  "sizeOfT--"
                let _182 := read_from_storage_split_offset_0_t_uint256(0x04)
                let _181 := decrement_t_uint256(_182)
                update_storage_value_offset_0t_uint256_to_t_uint256(0x04, _181)
                let expr_551 := _182
                /// @src 0:5355:5360  "resId"
                let _183 := var_resId_482
                let expr_556 := _183
                /// @src 0:5343:5344  "E"
                let _184 := 0x05
                let expr_553 := _184
                /// @src 0:5345:5351  "signer"
                let _185 := read_from_storage_split_offset_0_t_address(0x07)
                let expr_554 := _185
                /// @src 0:5343:5352  "E[signer]"
                let _186 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_553,expr_554)
                /// @src 0:5343:5360  "E[signer] = resId"
                update_storage_value_offset_0t_uint256_to_t_uint256(_186, expr_556)
                let expr_557 := expr_556
                /// @src 0:5386:5389  "res"
                let _187_mpos := var_res_504_mpos
                let expr_562_mpos := _187_mpos
                /// @src 0:5370:5375  "state"
                let _188 := 0x08
                let expr_559 := _188
                /// @src 0:5376:5382  "signer"
                let _189 := read_from_storage_split_offset_0_t_address(0x07)
                let expr_560 := _189
                /// @src 0:5370:5383  "state[signer]"
                let _190 := mapping_index_access_t_mapping$_t_address_$_t_struct$_DroppedRes_$45_storage_$_of_t_address(expr_559,expr_560)
                /// @src 0:5370:5389  "state[signer] = res"
                update_storage_value_offset_0t_struct$_DroppedRes_$45_memory_ptr_to_t_struct$_DroppedRes_$45_storage(_190, expr_562_mpos)
                let _191_slot := _190
                let expr_563_slot := _191_slot

            }
            /// @src 0:230:6207  "contract ResourceDroppingV5 is IProtectionLayerProtectorV3 {..."

            function store_literal_in_memory_ef17a6c59e8c0dc554db7139aceb96663973276e03d4c83ba8c1c0391576b6c5(memPtr) {

                mstore(add(memPtr, 0), "Resource not stored")

            }

            function abi_encode_t_stringliteral_ef17a6c59e8c0dc554db7139aceb96663973276e03d4c83ba8c1c0391576b6c5_to_t_string_memory_ptr_fromStack(pos) -> end {
                pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 19)
                store_literal_in_memory_ef17a6c59e8c0dc554db7139aceb96663973276e03d4c83ba8c1c0391576b6c5(pos)
                end := add(pos, 32)
            }

            function abi_encode_tuple_t_stringliteral_ef17a6c59e8c0dc554db7139aceb96663973276e03d4c83ba8c1c0391576b6c5__to_t_string_memory_ptr__fromStack(headStart ) -> tail {
                tail := add(headStart, 32)

                mstore(add(headStart, 0), sub(tail, headStart))
                tail := abi_encode_t_stringliteral_ef17a6c59e8c0dc554db7139aceb96663973276e03d4c83ba8c1c0391576b6c5_to_t_string_memory_ptr_fromStack( tail)

            }

            function require_helper_t_stringliteral_ef17a6c59e8c0dc554db7139aceb96663973276e03d4c83ba8c1c0391576b6c5(condition ) {
                if iszero(condition) {
                    let memPtr := allocate_unbounded()
                    mstore(memPtr, 0x08c379a000000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple_t_stringliteral_ef17a6c59e8c0dc554db7139aceb96663973276e03d4c83ba8c1c0391576b6c5__to_t_string_memory_ptr__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            /// @ast-id 675
            /// @src 0:5402:6145  "function unstoreExternal(uint256 resId) private {..."
            function fun_unstoreExternal_675(var_resId_568) {

                /// @src 0:5467:5471  "flag"
                let _192 := read_from_storage_split_offset_0_t_bool(0x06)
                let expr_572 := _192
                /// @src 0:5475:5479  "true"
                let expr_573 := 0x01
                /// @src 0:5467:5479  "flag == true"
                let expr_574 := eq(cleanup_t_bool(expr_572), cleanup_t_bool(expr_573))
                /// @src 0:5460:5480  "assert(flag == true)"
                assert_helper(expr_574)
                /// @src 0:5534:5535  "E"
                let _193 := 0x05
                let expr_578 := _193
                /// @src 0:5536:5542  "signer"
                let _194 := read_from_storage_split_offset_0_t_address(0x07)
                let expr_579 := _194
                /// @src 0:5534:5543  "E[signer]"
                let _195 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_578,expr_579)
                let _196 := read_from_storage_split_offset_0_t_uint256(_195)
                let expr_580 := _196
                /// @src 0:5547:5552  "resId"
                let _197 := var_resId_568
                let expr_581 := _197
                /// @src 0:5534:5552  "E[signer] == resId"
                let expr_582 := eq(cleanup_t_uint256(expr_580), cleanup_t_uint256(expr_581))
                /// @src 0:5527:5553  "assert(E[signer] == resId)"
                assert_helper(expr_582)
                /// @src 0:5598:5603  "state"
                let _198 := 0x08
                let expr_586 := _198
                /// @src 0:5604:5610  "signer"
                let _199 := read_from_storage_split_offset_0_t_address(0x07)
                let expr_587 := _199
                /// @src 0:5598:5611  "state[signer]"
                let _200 := mapping_index_access_t_mapping$_t_address_$_t_struct$_DroppedRes_$45_storage_$_of_t_address(expr_586,expr_587)
                let _201_slot := _200
                let expr_588_slot := _201_slot
                /// @src 0:5598:5616  "state[signer].flag"
                let _202 := add(expr_588_slot, 2)
                let _203 := read_from_storage_split_offset_0_t_bool(_202)
                let expr_589 := _203
                /// @src 0:5620:5624  "true"
                let expr_590 := 0x01
                /// @src 0:5598:5624  "state[signer].flag == true"
                let expr_591 := eq(cleanup_t_bool(expr_589), cleanup_t_bool(expr_590))
                /// @src 0:5591:5625  "assert(state[signer].flag == true)"
                assert_helper(expr_591)
                /// @src 0:5688:5693  "state"
                let _204 := 0x08
                let expr_597 := _204
                /// @src 0:5694:5700  "signer"
                let _205 := read_from_storage_split_offset_0_t_address(0x07)
                let expr_598 := _205
                /// @src 0:5688:5701  "state[signer]"
                let _206 := mapping_index_access_t_mapping$_t_address_$_t_struct$_DroppedRes_$45_storage_$_of_t_address(expr_597,expr_598)
                let _207_slot := _206
                let expr_599_slot := _207_slot
                /// @src 0:5664:5701  "DroppedRes memory res = state[signer]"
                let var_res_596_mpos := convert_t_struct$_DroppedRes_$45_storage_to_t_struct$_DroppedRes_$45_memory_ptr(expr_599_slot)
                /// @src 0:5719:5722  "res"
                let _208_mpos := var_res_596_mpos
                let expr_602_mpos := _208_mpos
                /// @src 0:5719:5724  "res.a"
                let _209 := add(expr_602_mpos, 0)
                let _210 := read_from_memoryt_uint256(_209)
                let expr_603 := _210
                /// @src 0:5728:5730  "14"
                let expr_604 := 0x0e
                /// @src 0:5719:5730  "res.a == 14"
                let expr_605 := eq(cleanup_t_uint256(expr_603), convert_t_rational_14_by_1_to_t_uint256(expr_604))
                /// @src 0:5711:5751  "require(res.a == 14, \"Invalid resource\")"
                require_helper_t_stringliteral_11fc13e0488c30e2cff22c9f1fa86759e037424cac4c981f07eb590a95f7a419(expr_605)
                /// @src 0:5769:5772  "res"
                let _211_mpos := var_res_596_mpos
                let expr_610_mpos := _211_mpos
                /// @src 0:5769:5777  "res.flag"
                let _212 := add(expr_610_mpos, 64)
                let _213 := read_from_memoryt_bool(_212)
                let expr_611 := _213
                /// @src 0:5781:5785  "true"
                let expr_612 := 0x01
                /// @src 0:5769:5785  "res.flag == true"
                let expr_613 := eq(cleanup_t_bool(expr_611), cleanup_t_bool(expr_612))
                /// @src 0:5761:5809  "require(res.flag == true, \"Resource not stored\")"
                require_helper_t_stringliteral_ef17a6c59e8c0dc554db7139aceb96663973276e03d4c83ba8c1c0391576b6c5(expr_613)
                /// @src 0:5830:5835  "false"
                let expr_620 := 0x00
                /// @src 0:5819:5822  "res"
                let _214_mpos := var_res_596_mpos
                let expr_617_mpos := _214_mpos
                /// @src 0:5819:5827  "res.flag"
                let _215 := add(expr_617_mpos, 64)
                /// @src 0:5819:5835  "res.flag = false"
                let _216 := expr_620
                write_to_memory_t_bool(_215, _216)
                let expr_621 := expr_620
                /// @src 0:5852:5853  "E"
                let _217 := 0x05
                let expr_623 := _217
                /// @src 0:5854:5860  "signer"
                let _218 := read_from_storage_split_offset_0_t_address(0x07)
                let expr_624 := _218
                /// @src 0:5852:5861  "E[signer]"
                let _219 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_623,expr_624)
                /// @src 0:5845:5861  "delete E[signer]"
                storage_set_to_zero_t_uint256(_219, 0)
                /// @src 0:5878:5883  "state"
                let _220 := 0x08
                let expr_628 := _220
                /// @src 0:5884:5890  "signer"
                let _221 := read_from_storage_split_offset_0_t_address(0x07)
                let expr_629 := _221
                /// @src 0:5878:5891  "state[signer]"
                let _222 := mapping_index_access_t_mapping$_t_address_$_t_struct$_DroppedRes_$45_storage_$_of_t_address(expr_628,expr_629)
                /// @src 0:5871:5891  "delete state[signer]"
                storage_set_to_zero_t_struct$_DroppedRes_$45_storage(_222, 0)
                /// @src 0:5908:5913  "state"
                let _223 := 0x08
                let expr_634 := _223
                /// @src 0:5914:5920  "signer"
                let _224 := read_from_storage_split_offset_0_t_address(0x07)
                let expr_635 := _224
                /// @src 0:5908:5921  "state[signer]"
                let _225 := mapping_index_access_t_mapping$_t_address_$_t_struct$_DroppedRes_$45_storage_$_of_t_address(expr_634,expr_635)
                let _226_slot := _225
                let expr_636_slot := _226_slot
                /// @src 0:5908:5926  "state[signer].flag"
                let _227 := add(expr_636_slot, 2)
                let _228 := read_from_storage_split_offset_0_t_bool(_227)
                let expr_637 := _228
                /// @src 0:5930:5935  "false"
                let expr_638 := 0x00
                /// @src 0:5908:5935  "state[signer].flag == false"
                let expr_639 := eq(cleanup_t_bool(expr_637), cleanup_t_bool(expr_638))
                /// @src 0:5901:5936  "assert(state[signer].flag == false)"
                assert_helper(expr_639)
                /// @src 0:5983:5988  "state"
                let _229 := 0x08
                let expr_643 := _229
                /// @src 0:5989:5995  "signer"
                let _230 := read_from_storage_split_offset_0_t_address(0x07)
                let expr_644 := _230
                /// @src 0:5983:5996  "state[signer]"
                let _231 := mapping_index_access_t_mapping$_t_address_$_t_struct$_DroppedRes_$45_storage_$_of_t_address(expr_643,expr_644)
                let _232_slot := _231
                let expr_645_slot := _232_slot
                /// @src 0:5983:5998  "state[signer].a"
                let _233 := add(expr_645_slot, 0)
                let _234 := read_from_storage_split_offset_0_t_uint256(_233)
                let expr_646 := _234
                /// @src 0:6002:6003  "0"
                let expr_647 := 0x00
                /// @src 0:5983:6003  "state[signer].a == 0"
                let expr_648 := eq(cleanup_t_uint256(expr_646), convert_t_rational_0_by_1_to_t_uint256(expr_647))
                /// @src 0:5976:6004  "assert(state[signer].a == 0)"
                assert_helper(expr_648)
                /// @src 0:6041:6050  "sizeOfH++"
                let _236 := read_from_storage_split_offset_0_t_uint256(0x02)
                let _235 := increment_t_uint256(_236)
                update_storage_value_offset_0t_uint256_to_t_uint256(0x02, _235)
                let expr_652 := _236
                /// @src 0:6079:6087  "Type.res"
                let expr_660 := 1
                /// @src 0:6060:6061  "H"
                let _237 := 0x01
                let expr_654 := _237
                /// @src 0:6062:6068  "signer"
                let _238 := read_from_storage_split_offset_0_t_address(0x07)
                let expr_655 := _238
                /// @src 0:6060:6069  "H[signer]"
                let _239 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_uint256_$_t_enum$_Type_$8_$_$_of_t_address(expr_654,expr_655)
                let _240 := _239
                let expr_657 := _240
                /// @src 0:6070:6075  "resId"
                let _241 := var_resId_568
                let expr_656 := _241
                /// @src 0:6060:6076  "H[signer][resId]"
                let _242 := mapping_index_access_t_mapping$_t_uint256_$_t_enum$_Type_$8_$_of_t_uint256(expr_657,expr_656)
                /// @src 0:6060:6087  "H[signer][resId] = Type.res"
                update_storage_value_offset_0t_enum$_Type_$8_to_t_enum$_Type_$8(_242, expr_660)
                let expr_661 := expr_660
                /// @src 0:6097:6106  "sizeOfT++"
                let _244 := read_from_storage_split_offset_0_t_uint256(0x04)
                let _243 := increment_t_uint256(_244)
                update_storage_value_offset_0t_uint256_to_t_uint256(0x04, _243)
                let expr_664 := _244
                /// @src 0:6135:6138  "res"
                let _245_mpos := var_res_596_mpos
                let expr_671_mpos := _245_mpos
                /// @src 0:6116:6117  "T"
                let _246 := 0x03
                let expr_666 := _246
                /// @src 0:6118:6124  "signer"
                let _247 := read_from_storage_split_offset_0_t_address(0x07)
                let expr_667 := _247
                /// @src 0:6116:6125  "T[signer]"
                let _248 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_uint256_$_t_struct$_DroppedRes_$45_storage_$_$_of_t_address(expr_666,expr_667)
                let _249 := _248
                let expr_669 := _249
                /// @src 0:6126:6131  "resId"
                let _250 := var_resId_568
                let expr_668 := _250
                /// @src 0:6116:6132  "T[signer][resId]"
                let _251 := mapping_index_access_t_mapping$_t_uint256_$_t_struct$_DroppedRes_$45_storage_$_of_t_uint256(expr_669,expr_668)
                /// @src 0:6116:6138  "T[signer][resId] = res"
                update_storage_value_offset_0t_struct$_DroppedRes_$45_memory_ptr_to_t_struct$_DroppedRes_$45_storage(_251, expr_671_mpos)
                let _252_slot := _251
                let expr_672_slot := _252_slot

            }
            /// @src 0:230:6207  "contract ResourceDroppingV5 is IProtectionLayerProtectorV3 {..."

            /// @ast-id 682
            /// @src 0:6151:6205  "function unpack(DroppedRes memory res) private view {}"
            function fun_unpack_682(var_res_678_mpos) {

            }
            /// @src 0:230:6207  "contract ResourceDroppingV5 is IProtectionLayerProtectorV3 {..."

        }

        data ".metadata" hex"a364697066735822122067f93b9614a9f9996d283c3923ea792e9bfda8eafd1d845651c3a7938d5fde3b6c6578706572696d656e74616cf564736f6c634300080b0041"
    }

}