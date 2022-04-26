from starkware.cairo.common.alloc import alloc

from {{ cookiecutter.project_slug }}.onnx_cairo.small_math import (
    Fix64x61,
    Double,
    Double_to_Fix,
    show_Double,
    Small_Math_mul,
    Small_Math_add
)

from onnx_cairo.tensor_data_types import (
    Tensor,
    init_tensor
)

# Error handling

# error = 0
#   non-specific error

# error = 1
#   dimensions not right

# 

func error_coder (error: felt) -> (res: Tensor):
    alloc_locals
    let (dims: felt*) = alloc()
    
    assert ([dims]) = 0

    let (elements: felt*) = alloc()
    assert ([elements]) = error

    let (res: Tensor) = init_tensor (0, dims, 1, elements)
    return (res = res)
end

# func error_coder_fix (error: felt) -> (res: Tensor):
#     alloc_locals
#     let (dims: felt*) = alloc()
    
#     assert ([dims]) = 0

#     let (elements: Fix64x61*) = alloc()
#     assert ([elements]) = Fix64x61(val = error)

#     TODO: pass tensorfix for fix tensor errors
#     let (res: TensorFix) = init_tensor (0, dims, 1, elements)
#     return (res = res)
# end