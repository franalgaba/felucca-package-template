# Declare this file as a StarkNet contract.
%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin

# from onnx_cairo_package.onnx_cairo import Mul, ReduceSum, Add
from {{ cookiecutter.project_slug }}.c4_tensor_loader import load_tensor_c4
from {{ cookiecutter.project_slug }}.c3_tensor_loader import load_tensor_c3


# result of latest inference
@storage_var
func inference_result() -> (res : felt):
end

# Starts the inference computation.
@external
func predict{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr}(
        input : felt*):

    # Read Tensors
    let (c3_node) = load_tensor_c3()
    let (c4_node) = load_tensor_c4()

    # Read inputs
    let (zx) = input 

    # Build graph
    # let (mulx) = Mul(zx, c3)
    # let (sumx) = ReduceSum(mulx)
    # let (yhatlog) = Add(sumx, c4)
    # inference_result.write(yhatlog)
    return ()
end

# Returns the latest inference.
@view
func get_inference{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr}() -> (
        res : felt):
    let (res) = inference_result.read()
    return (res)
end