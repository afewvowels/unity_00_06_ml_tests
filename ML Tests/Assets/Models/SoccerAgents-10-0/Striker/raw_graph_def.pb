
C
global_step/initial_valueConst*
value	B : *
dtype0
W
global_step
VariableV2*
shape: *
shared_name *
dtype0*
	container 

global_step/AssignAssignglobal_stepglobal_step/initial_value*
use_locking(*
T0*
_class
loc:@global_step*
validate_shape(
R
global_step/readIdentityglobal_step*
T0*
_class
loc:@global_step
;
steps_to_incrementPlaceholder*
shape: *
dtype0
9
AddAddglobal_step/readsteps_to_increment*
T0
t
AssignAssignglobal_stepAdd*
use_locking(*
T0*
_class
loc:@global_step*
validate_shape(
5

batch_sizePlaceholder*
shape:*
dtype0
:
sequence_lengthPlaceholder*
shape:*
dtype0
;
masksPlaceholder*
shape:’’’’’’’’’*
dtype0
;
CastCastmasks*

SrcT0*
Truncate( *

DstT0
M
#is_continuous_control/initial_valueConst*
value	B : *
dtype0
a
is_continuous_control
VariableV2*
shape: *
shared_name *
dtype0*
	container 
¾
is_continuous_control/AssignAssignis_continuous_control#is_continuous_control/initial_value*
use_locking(*
T0*(
_class
loc:@is_continuous_control*
validate_shape(
p
is_continuous_control/readIdentityis_continuous_control*
T0*(
_class
loc:@is_continuous_control
F
version_number/initial_valueConst*
value	B :*
dtype0
Z
version_number
VariableV2*
shape: *
shared_name *
dtype0*
	container 
¢
version_number/AssignAssignversion_numberversion_number/initial_value*
use_locking(*
T0*!
_class
loc:@version_number*
validate_shape(
[
version_number/readIdentityversion_number*
T0*!
_class
loc:@version_number
C
memory_size/initial_valueConst*
value	B : *
dtype0
W
memory_size
VariableV2*
shape: *
shared_name *
dtype0*
	container 

memory_size/AssignAssignmemory_sizememory_size/initial_value*
use_locking(*
T0*
_class
loc:@memory_size*
validate_shape(
R
memory_size/readIdentitymemory_size*
T0*
_class
loc:@memory_size
K
!action_output_shape/initial_valueConst*
value	B :*
dtype0
_
action_output_shape
VariableV2*
shape: *
shared_name *
dtype0*
	container 
¶
action_output_shape/AssignAssignaction_output_shape!action_output_shape/initial_value*
use_locking(*
T0*&
_class
loc:@action_output_shape*
validate_shape(
j
action_output_shape/readIdentityaction_output_shape*
T0*&
_class
loc:@action_output_shape
M
vector_observationPlaceholder*
shape:’’’’’’’’’½*
dtype0
v
$normalization_steps/Initializer/onesConst*&
_class
loc:@normalization_steps*
value	B :*
dtype0

normalization_steps
VariableV2*
shape: *
shared_name *&
_class
loc:@normalization_steps*
dtype0*
	container 
¹
normalization_steps/AssignAssignnormalization_steps$normalization_steps/Initializer/ones*
use_locking(*
T0*&
_class
loc:@normalization_steps*
validate_shape(
j
normalization_steps/readIdentitynormalization_steps*
T0*&
_class
loc:@normalization_steps
q
running_mean/Initializer/zerosConst*
_class
loc:@running_mean*
valueB½*    *
dtype0
~
running_mean
VariableV2*
shape:½*
shared_name *
_class
loc:@running_mean*
dtype0*
	container 

running_mean/AssignAssignrunning_meanrunning_mean/Initializer/zeros*
use_locking(*
T0*
_class
loc:@running_mean*
validate_shape(
U
running_mean/readIdentityrunning_mean*
T0*
_class
loc:@running_mean
x
!running_variance/Initializer/onesConst*#
_class
loc:@running_variance*
valueB½*  ?*
dtype0

running_variance
VariableV2*
shape:½*
shared_name *#
_class
loc:@running_variance*
dtype0*
	container 
­
running_variance/AssignAssignrunning_variance!running_variance/Initializer/ones*
use_locking(*
T0*#
_class
loc:@running_variance*
validate_shape(
a
running_variance/readIdentityrunning_variance*
T0*#
_class
loc:@running_variance
@
Mean/reduction_indicesConst*
value	B : *
dtype0
^
MeanMeanvector_observationMean/reduction_indices*

Tidx0*
	keep_dims( *
T0
,
subSubMeanrunning_mean/read*
T0
1
Add_1/yConst*
value	B :*
dtype0
8
Add_1Addnormalization_steps/readAdd_1/y*
T0
=
Cast_1CastAdd_1*

SrcT0*
Truncate( *

DstT0
(
truedivRealDivsubCast_1*
T0
3
add_2AddV2running_mean/readtruediv*
T0
"
sub_1SubMeanadd_2*
T0
.
sub_2SubMeanrunning_mean/read*
T0
!
mulMulsub_1sub_2*
T0
3
add_3AddV2running_variance/readmul*
T0
z
Assign_1Assignrunning_meanadd_2*
use_locking(*
T0*
_class
loc:@running_mean*
validate_shape(

Assign_2Assignrunning_varianceadd_3*
use_locking(*
T0*#
_class
loc:@running_variance*
validate_shape(
1
add_4/yConst*
value	B :*
dtype0
:
add_4AddV2normalization_steps/readadd_4/y*
T0

Assign_3Assignnormalization_stepsadd_4*
use_locking(*
T0*&
_class
loc:@normalization_steps*
validate_shape(
3

group_depsNoOp	^Assign_1	^Assign_2	^Assign_3
<
sub_3Subvector_observationrunning_mean/read*
T0
P
Cast_2Castnormalization_steps/read*

SrcT0*
Truncate( *

DstT0
4
add_5/yConst*
valueB
 *  ?*
dtype0
(
add_5AddV2Cast_2add_5/y*
T0
;
	truediv_1RealDivrunning_variance/readadd_5*
T0
 
SqrtSqrt	truediv_1*
T0
*
	truediv_2RealDivsub_3Sqrt*
T0
G
normalized_state/Minimum/yConst*
valueB
 *   @*
dtype0
S
normalized_state/MinimumMinimum	truediv_2normalized_state/Minimum/y*
T0
?
normalized_state/yConst*
valueB
 *   Ą*
dtype0
R
normalized_stateMaximumnormalized_state/Minimumnormalized_state/y*
T0
„
?main_graph_0/hidden_0/kernel/Initializer/truncated_normal/shapeConst*/
_class%
#!loc:@main_graph_0/hidden_0/kernel*
valueB"=     *
dtype0

>main_graph_0/hidden_0/kernel/Initializer/truncated_normal/meanConst*/
_class%
#!loc:@main_graph_0/hidden_0/kernel*
valueB
 *    *
dtype0

@main_graph_0/hidden_0/kernel/Initializer/truncated_normal/stddevConst*/
_class%
#!loc:@main_graph_0/hidden_0/kernel*
valueB
 *xB=*
dtype0
ž
Imain_graph_0/hidden_0/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormal?main_graph_0/hidden_0/kernel/Initializer/truncated_normal/shape*
seed»*
T0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel*
dtype0*
seed2H

=main_graph_0/hidden_0/kernel/Initializer/truncated_normal/mulMulImain_graph_0/hidden_0/kernel/Initializer/truncated_normal/TruncatedNormal@main_graph_0/hidden_0/kernel/Initializer/truncated_normal/stddev*
T0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel
ł
9main_graph_0/hidden_0/kernel/Initializer/truncated_normalAdd=main_graph_0/hidden_0/kernel/Initializer/truncated_normal/mul>main_graph_0/hidden_0/kernel/Initializer/truncated_normal/mean*
T0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel
£
main_graph_0/hidden_0/kernel
VariableV2*
shape:
½*
shared_name */
_class%
#!loc:@main_graph_0/hidden_0/kernel*
dtype0*
	container 
é
#main_graph_0/hidden_0/kernel/AssignAssignmain_graph_0/hidden_0/kernel9main_graph_0/hidden_0/kernel/Initializer/truncated_normal*
use_locking(*
T0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel*
validate_shape(

!main_graph_0/hidden_0/kernel/readIdentitymain_graph_0/hidden_0/kernel*
T0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel

,main_graph_0/hidden_0/bias/Initializer/zerosConst*-
_class#
!loc:@main_graph_0/hidden_0/bias*
valueB*    *
dtype0

main_graph_0/hidden_0/bias
VariableV2*
shape:*
shared_name *-
_class#
!loc:@main_graph_0/hidden_0/bias*
dtype0*
	container 
Ö
!main_graph_0/hidden_0/bias/AssignAssignmain_graph_0/hidden_0/bias,main_graph_0/hidden_0/bias/Initializer/zeros*
use_locking(*
T0*-
_class#
!loc:@main_graph_0/hidden_0/bias*
validate_shape(

main_graph_0/hidden_0/bias/readIdentitymain_graph_0/hidden_0/bias*
T0*-
_class#
!loc:@main_graph_0/hidden_0/bias

main_graph_0/hidden_0/MatMulMatMulnormalized_state!main_graph_0/hidden_0/kernel/read*
transpose_b( *
T0*
transpose_a( 

main_graph_0/hidden_0/BiasAddBiasAddmain_graph_0/hidden_0/MatMulmain_graph_0/hidden_0/bias/read*
T0*
data_formatNHWC
P
main_graph_0/hidden_0/SigmoidSigmoidmain_graph_0/hidden_0/BiasAdd*
T0
g
main_graph_0/hidden_0/MulMulmain_graph_0/hidden_0/BiasAddmain_graph_0/hidden_0/Sigmoid*
T0
„
?main_graph_0/hidden_1/kernel/Initializer/truncated_normal/shapeConst*/
_class%
#!loc:@main_graph_0/hidden_1/kernel*
valueB"      *
dtype0

>main_graph_0/hidden_1/kernel/Initializer/truncated_normal/meanConst*/
_class%
#!loc:@main_graph_0/hidden_1/kernel*
valueB
 *    *
dtype0

@main_graph_0/hidden_1/kernel/Initializer/truncated_normal/stddevConst*/
_class%
#!loc:@main_graph_0/hidden_1/kernel*
valueB
 *6=*
dtype0
ž
Imain_graph_0/hidden_1/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormal?main_graph_0/hidden_1/kernel/Initializer/truncated_normal/shape*
seed»*
T0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel*
dtype0*
seed2Y

=main_graph_0/hidden_1/kernel/Initializer/truncated_normal/mulMulImain_graph_0/hidden_1/kernel/Initializer/truncated_normal/TruncatedNormal@main_graph_0/hidden_1/kernel/Initializer/truncated_normal/stddev*
T0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel
ł
9main_graph_0/hidden_1/kernel/Initializer/truncated_normalAdd=main_graph_0/hidden_1/kernel/Initializer/truncated_normal/mul>main_graph_0/hidden_1/kernel/Initializer/truncated_normal/mean*
T0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel
£
main_graph_0/hidden_1/kernel
VariableV2*
shape:
*
shared_name */
_class%
#!loc:@main_graph_0/hidden_1/kernel*
dtype0*
	container 
é
#main_graph_0/hidden_1/kernel/AssignAssignmain_graph_0/hidden_1/kernel9main_graph_0/hidden_1/kernel/Initializer/truncated_normal*
use_locking(*
T0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel*
validate_shape(

!main_graph_0/hidden_1/kernel/readIdentitymain_graph_0/hidden_1/kernel*
T0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel

,main_graph_0/hidden_1/bias/Initializer/zerosConst*-
_class#
!loc:@main_graph_0/hidden_1/bias*
valueB*    *
dtype0

main_graph_0/hidden_1/bias
VariableV2*
shape:*
shared_name *-
_class#
!loc:@main_graph_0/hidden_1/bias*
dtype0*
	container 
Ö
!main_graph_0/hidden_1/bias/AssignAssignmain_graph_0/hidden_1/bias,main_graph_0/hidden_1/bias/Initializer/zeros*
use_locking(*
T0*-
_class#
!loc:@main_graph_0/hidden_1/bias*
validate_shape(

main_graph_0/hidden_1/bias/readIdentitymain_graph_0/hidden_1/bias*
T0*-
_class#
!loc:@main_graph_0/hidden_1/bias

main_graph_0/hidden_1/MatMulMatMulmain_graph_0/hidden_0/Mul!main_graph_0/hidden_1/kernel/read*
transpose_b( *
T0*
transpose_a( 

main_graph_0/hidden_1/BiasAddBiasAddmain_graph_0/hidden_1/MatMulmain_graph_0/hidden_1/bias/read*
T0*
data_formatNHWC
P
main_graph_0/hidden_1/SigmoidSigmoidmain_graph_0/hidden_1/BiasAdd*
T0
g
main_graph_0/hidden_1/MulMulmain_graph_0/hidden_1/BiasAddmain_graph_0/hidden_1/Sigmoid*
T0
„
?main_graph_0/hidden_2/kernel/Initializer/truncated_normal/shapeConst*/
_class%
#!loc:@main_graph_0/hidden_2/kernel*
valueB"      *
dtype0

>main_graph_0/hidden_2/kernel/Initializer/truncated_normal/meanConst*/
_class%
#!loc:@main_graph_0/hidden_2/kernel*
valueB
 *    *
dtype0

@main_graph_0/hidden_2/kernel/Initializer/truncated_normal/stddevConst*/
_class%
#!loc:@main_graph_0/hidden_2/kernel*
valueB
 *6=*
dtype0
ž
Imain_graph_0/hidden_2/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormal?main_graph_0/hidden_2/kernel/Initializer/truncated_normal/shape*
seed»*
T0*/
_class%
#!loc:@main_graph_0/hidden_2/kernel*
dtype0*
seed2j

=main_graph_0/hidden_2/kernel/Initializer/truncated_normal/mulMulImain_graph_0/hidden_2/kernel/Initializer/truncated_normal/TruncatedNormal@main_graph_0/hidden_2/kernel/Initializer/truncated_normal/stddev*
T0*/
_class%
#!loc:@main_graph_0/hidden_2/kernel
ł
9main_graph_0/hidden_2/kernel/Initializer/truncated_normalAdd=main_graph_0/hidden_2/kernel/Initializer/truncated_normal/mul>main_graph_0/hidden_2/kernel/Initializer/truncated_normal/mean*
T0*/
_class%
#!loc:@main_graph_0/hidden_2/kernel
£
main_graph_0/hidden_2/kernel
VariableV2*
shape:
*
shared_name */
_class%
#!loc:@main_graph_0/hidden_2/kernel*
dtype0*
	container 
é
#main_graph_0/hidden_2/kernel/AssignAssignmain_graph_0/hidden_2/kernel9main_graph_0/hidden_2/kernel/Initializer/truncated_normal*
use_locking(*
T0*/
_class%
#!loc:@main_graph_0/hidden_2/kernel*
validate_shape(

!main_graph_0/hidden_2/kernel/readIdentitymain_graph_0/hidden_2/kernel*
T0*/
_class%
#!loc:@main_graph_0/hidden_2/kernel

,main_graph_0/hidden_2/bias/Initializer/zerosConst*-
_class#
!loc:@main_graph_0/hidden_2/bias*
valueB*    *
dtype0

main_graph_0/hidden_2/bias
VariableV2*
shape:*
shared_name *-
_class#
!loc:@main_graph_0/hidden_2/bias*
dtype0*
	container 
Ö
!main_graph_0/hidden_2/bias/AssignAssignmain_graph_0/hidden_2/bias,main_graph_0/hidden_2/bias/Initializer/zeros*
use_locking(*
T0*-
_class#
!loc:@main_graph_0/hidden_2/bias*
validate_shape(

main_graph_0/hidden_2/bias/readIdentitymain_graph_0/hidden_2/bias*
T0*-
_class#
!loc:@main_graph_0/hidden_2/bias

main_graph_0/hidden_2/MatMulMatMulmain_graph_0/hidden_1/Mul!main_graph_0/hidden_2/kernel/read*
transpose_b( *
T0*
transpose_a( 

main_graph_0/hidden_2/BiasAddBiasAddmain_graph_0/hidden_2/MatMulmain_graph_0/hidden_2/bias/read*
T0*
data_formatNHWC
P
main_graph_0/hidden_2/SigmoidSigmoidmain_graph_0/hidden_2/BiasAdd*
T0
g
main_graph_0/hidden_2/MulMulmain_graph_0/hidden_2/BiasAddmain_graph_0/hidden_2/Sigmoid*
T0
„
?main_graph_0/hidden_3/kernel/Initializer/truncated_normal/shapeConst*/
_class%
#!loc:@main_graph_0/hidden_3/kernel*
valueB"      *
dtype0

>main_graph_0/hidden_3/kernel/Initializer/truncated_normal/meanConst*/
_class%
#!loc:@main_graph_0/hidden_3/kernel*
valueB
 *    *
dtype0

@main_graph_0/hidden_3/kernel/Initializer/truncated_normal/stddevConst*/
_class%
#!loc:@main_graph_0/hidden_3/kernel*
valueB
 *6=*
dtype0
ž
Imain_graph_0/hidden_3/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormal?main_graph_0/hidden_3/kernel/Initializer/truncated_normal/shape*
seed»*
T0*/
_class%
#!loc:@main_graph_0/hidden_3/kernel*
dtype0*
seed2{

=main_graph_0/hidden_3/kernel/Initializer/truncated_normal/mulMulImain_graph_0/hidden_3/kernel/Initializer/truncated_normal/TruncatedNormal@main_graph_0/hidden_3/kernel/Initializer/truncated_normal/stddev*
T0*/
_class%
#!loc:@main_graph_0/hidden_3/kernel
ł
9main_graph_0/hidden_3/kernel/Initializer/truncated_normalAdd=main_graph_0/hidden_3/kernel/Initializer/truncated_normal/mul>main_graph_0/hidden_3/kernel/Initializer/truncated_normal/mean*
T0*/
_class%
#!loc:@main_graph_0/hidden_3/kernel
£
main_graph_0/hidden_3/kernel
VariableV2*
shape:
*
shared_name */
_class%
#!loc:@main_graph_0/hidden_3/kernel*
dtype0*
	container 
é
#main_graph_0/hidden_3/kernel/AssignAssignmain_graph_0/hidden_3/kernel9main_graph_0/hidden_3/kernel/Initializer/truncated_normal*
use_locking(*
T0*/
_class%
#!loc:@main_graph_0/hidden_3/kernel*
validate_shape(

!main_graph_0/hidden_3/kernel/readIdentitymain_graph_0/hidden_3/kernel*
T0*/
_class%
#!loc:@main_graph_0/hidden_3/kernel

,main_graph_0/hidden_3/bias/Initializer/zerosConst*-
_class#
!loc:@main_graph_0/hidden_3/bias*
valueB*    *
dtype0

main_graph_0/hidden_3/bias
VariableV2*
shape:*
shared_name *-
_class#
!loc:@main_graph_0/hidden_3/bias*
dtype0*
	container 
Ö
!main_graph_0/hidden_3/bias/AssignAssignmain_graph_0/hidden_3/bias,main_graph_0/hidden_3/bias/Initializer/zeros*
use_locking(*
T0*-
_class#
!loc:@main_graph_0/hidden_3/bias*
validate_shape(

main_graph_0/hidden_3/bias/readIdentitymain_graph_0/hidden_3/bias*
T0*-
_class#
!loc:@main_graph_0/hidden_3/bias

main_graph_0/hidden_3/MatMulMatMulmain_graph_0/hidden_2/Mul!main_graph_0/hidden_3/kernel/read*
transpose_b( *
T0*
transpose_a( 

main_graph_0/hidden_3/BiasAddBiasAddmain_graph_0/hidden_3/MatMulmain_graph_0/hidden_3/bias/read*
T0*
data_formatNHWC
P
main_graph_0/hidden_3/SigmoidSigmoidmain_graph_0/hidden_3/BiasAdd*
T0
g
main_graph_0/hidden_3/MulMulmain_graph_0/hidden_3/BiasAddmain_graph_0/hidden_3/Sigmoid*
T0

/dense/kernel/Initializer/truncated_normal/shapeConst*
_class
loc:@dense/kernel*
valueB"      *
dtype0
|
.dense/kernel/Initializer/truncated_normal/meanConst*
_class
loc:@dense/kernel*
valueB
 *    *
dtype0
~
0dense/kernel/Initializer/truncated_normal/stddevConst*
_class
loc:@dense/kernel*
valueB
 *Óč;*
dtype0
Ļ
9dense/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormal/dense/kernel/Initializer/truncated_normal/shape*
seed»*
T0*
_class
loc:@dense/kernel*
dtype0*
seed2
Ė
-dense/kernel/Initializer/truncated_normal/mulMul9dense/kernel/Initializer/truncated_normal/TruncatedNormal0dense/kernel/Initializer/truncated_normal/stddev*
T0*
_class
loc:@dense/kernel
¹
)dense/kernel/Initializer/truncated_normalAdd-dense/kernel/Initializer/truncated_normal/mul.dense/kernel/Initializer/truncated_normal/mean*
T0*
_class
loc:@dense/kernel

dense/kernel
VariableV2*
shape:	*
shared_name *
_class
loc:@dense/kernel*
dtype0*
	container 
©
dense/kernel/AssignAssigndense/kernel)dense/kernel/Initializer/truncated_normal*
use_locking(*
T0*
_class
loc:@dense/kernel*
validate_shape(
U
dense/kernel/readIdentitydense/kernel*
T0*
_class
loc:@dense/kernel
s
dense/MatMulMatMulmain_graph_0/hidden_3/Muldense/kernel/read*
transpose_b( *
T0*
transpose_a( 
A
action_probs/concat_dimConst*
value	B :*
dtype0
<
action_probs/action_probsIdentitydense/MatMul*
T0
F
action_masksPlaceholder*
shape:’’’’’’’’’*
dtype0
H
strided_slice/stackConst*
valueB"        *
dtype0
J
strided_slice/stack_1Const*
valueB"       *
dtype0
J
strided_slice/stack_2Const*
valueB"      *
dtype0
õ
strided_sliceStridedSliceaction_probs/action_probsstrided_slice/stackstrided_slice/stack_1strided_slice/stack_2*
T0*
Index0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
J
strided_slice_1/stackConst*
valueB"        *
dtype0
L
strided_slice_1/stack_1Const*
valueB"       *
dtype0
L
strided_slice_1/stack_2Const*
valueB"      *
dtype0
š
strided_slice_1StridedSliceaction_masksstrided_slice_1/stackstrided_slice_1/stack_1strided_slice_1/stack_2*
T0*
Index0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
*
SoftmaxSoftmaxstrided_slice*
T0
4
add_6/yConst*
valueB
 *æÖ3*
dtype0
)
add_6AddV2Softmaxadd_6/y*
T0
-
Mul_1Muladd_6strided_slice_1*
T0
?
Sum/reduction_indicesConst*
value	B :*
dtype0
N
SumSumMul_1Sum/reduction_indices*

Tidx0*
	keep_dims(*
T0
)
	truediv_3RealDivMul_1Sum*
T0
4
add_7/yConst*
valueB
 *æÖ3*
dtype0
+
add_7AddV2	truediv_3add_7/y*
T0

LogLogadd_7*
T0
M
#multinomial/Multinomial/num_samplesConst*
value	B :*
dtype0

multinomial/MultinomialMultinomialLog#multinomial/Multinomial/num_samples*
seed»*
output_dtype0	*
T0*
seed2Ø
;
concat/concat_dimConst*
value	B :*
dtype0
;
concat/concatIdentitymultinomial/Multinomial*
T0	
=
concat_1/concat_dimConst*
value	B :*
dtype0
/
concat_1/concatIdentity	truediv_3*
T0
4
add_8/yConst*
valueB
 *æÖ3*
dtype0
+
add_8AddV2	truediv_3add_8/y*
T0

Log_1Logadd_8*
T0
=
concat_2/concat_dimConst*
value	B :*
dtype0
+
concat_2/concatIdentityLog_1*
T0
,
IdentityIdentityconcat/concat*
T0	
,
actionIdentityconcat_2/concat*
T0

7extrinsic_value/kernel/Initializer/random_uniform/shapeConst*)
_class
loc:@extrinsic_value/kernel*
valueB"      *
dtype0

5extrinsic_value/kernel/Initializer/random_uniform/minConst*)
_class
loc:@extrinsic_value/kernel*
valueB
 *Iv¾*
dtype0

5extrinsic_value/kernel/Initializer/random_uniform/maxConst*)
_class
loc:@extrinsic_value/kernel*
valueB
 *Iv>*
dtype0
å
?extrinsic_value/kernel/Initializer/random_uniform/RandomUniformRandomUniform7extrinsic_value/kernel/Initializer/random_uniform/shape*
seed»*
T0*)
_class
loc:@extrinsic_value/kernel*
dtype0*
seed2ø
Ž
5extrinsic_value/kernel/Initializer/random_uniform/subSub5extrinsic_value/kernel/Initializer/random_uniform/max5extrinsic_value/kernel/Initializer/random_uniform/min*
T0*)
_class
loc:@extrinsic_value/kernel
č
5extrinsic_value/kernel/Initializer/random_uniform/mulMul?extrinsic_value/kernel/Initializer/random_uniform/RandomUniform5extrinsic_value/kernel/Initializer/random_uniform/sub*
T0*)
_class
loc:@extrinsic_value/kernel
Ś
1extrinsic_value/kernel/Initializer/random_uniformAdd5extrinsic_value/kernel/Initializer/random_uniform/mul5extrinsic_value/kernel/Initializer/random_uniform/min*
T0*)
_class
loc:@extrinsic_value/kernel

extrinsic_value/kernel
VariableV2*
shape:	*
shared_name *)
_class
loc:@extrinsic_value/kernel*
dtype0*
	container 
Ļ
extrinsic_value/kernel/AssignAssignextrinsic_value/kernel1extrinsic_value/kernel/Initializer/random_uniform*
use_locking(*
T0*)
_class
loc:@extrinsic_value/kernel*
validate_shape(
s
extrinsic_value/kernel/readIdentityextrinsic_value/kernel*
T0*)
_class
loc:@extrinsic_value/kernel

&extrinsic_value/bias/Initializer/zerosConst*'
_class
loc:@extrinsic_value/bias*
valueB*    *
dtype0

extrinsic_value/bias
VariableV2*
shape:*
shared_name *'
_class
loc:@extrinsic_value/bias*
dtype0*
	container 
¾
extrinsic_value/bias/AssignAssignextrinsic_value/bias&extrinsic_value/bias/Initializer/zeros*
use_locking(*
T0*'
_class
loc:@extrinsic_value/bias*
validate_shape(
m
extrinsic_value/bias/readIdentityextrinsic_value/bias*
T0*'
_class
loc:@extrinsic_value/bias

extrinsic_value/MatMulMatMulmain_graph_0/hidden_3/Mulextrinsic_value/kernel/read*
transpose_b( *
T0*
transpose_a( 
u
extrinsic_value/BiasAddBiasAddextrinsic_value/MatMulextrinsic_value/bias/read*
T0*
data_formatNHWC

7curiosity_value/kernel/Initializer/random_uniform/shapeConst*)
_class
loc:@curiosity_value/kernel*
valueB"      *
dtype0

5curiosity_value/kernel/Initializer/random_uniform/minConst*)
_class
loc:@curiosity_value/kernel*
valueB
 *Iv¾*
dtype0

5curiosity_value/kernel/Initializer/random_uniform/maxConst*)
_class
loc:@curiosity_value/kernel*
valueB
 *Iv>*
dtype0
å
?curiosity_value/kernel/Initializer/random_uniform/RandomUniformRandomUniform7curiosity_value/kernel/Initializer/random_uniform/shape*
seed»*
T0*)
_class
loc:@curiosity_value/kernel*
dtype0*
seed2Č
Ž
5curiosity_value/kernel/Initializer/random_uniform/subSub5curiosity_value/kernel/Initializer/random_uniform/max5curiosity_value/kernel/Initializer/random_uniform/min*
T0*)
_class
loc:@curiosity_value/kernel
č
5curiosity_value/kernel/Initializer/random_uniform/mulMul?curiosity_value/kernel/Initializer/random_uniform/RandomUniform5curiosity_value/kernel/Initializer/random_uniform/sub*
T0*)
_class
loc:@curiosity_value/kernel
Ś
1curiosity_value/kernel/Initializer/random_uniformAdd5curiosity_value/kernel/Initializer/random_uniform/mul5curiosity_value/kernel/Initializer/random_uniform/min*
T0*)
_class
loc:@curiosity_value/kernel

curiosity_value/kernel
VariableV2*
shape:	*
shared_name *)
_class
loc:@curiosity_value/kernel*
dtype0*
	container 
Ļ
curiosity_value/kernel/AssignAssigncuriosity_value/kernel1curiosity_value/kernel/Initializer/random_uniform*
use_locking(*
T0*)
_class
loc:@curiosity_value/kernel*
validate_shape(
s
curiosity_value/kernel/readIdentitycuriosity_value/kernel*
T0*)
_class
loc:@curiosity_value/kernel

&curiosity_value/bias/Initializer/zerosConst*'
_class
loc:@curiosity_value/bias*
valueB*    *
dtype0

curiosity_value/bias
VariableV2*
shape:*
shared_name *'
_class
loc:@curiosity_value/bias*
dtype0*
	container 
¾
curiosity_value/bias/AssignAssigncuriosity_value/bias&curiosity_value/bias/Initializer/zeros*
use_locking(*
T0*'
_class
loc:@curiosity_value/bias*
validate_shape(
m
curiosity_value/bias/readIdentitycuriosity_value/bias*
T0*'
_class
loc:@curiosity_value/bias

curiosity_value/MatMulMatMulmain_graph_0/hidden_3/Mulcuriosity_value/kernel/read*
transpose_b( *
T0*
transpose_a( 
u
curiosity_value/BiasAddBiasAddcuriosity_value/MatMulcuriosity_value/bias/read*
T0*
data_formatNHWC
d
Mean_1/inputPackextrinsic_value/BiasAddcuriosity_value/BiasAdd*
T0*

axis *
N
B
Mean_1/reduction_indicesConst*
value	B : *
dtype0
\
Mean_1MeanMean_1/inputMean_1/reduction_indices*

Tidx0*
	keep_dims( *
T0
G
action_holderPlaceholder*
shape:’’’’’’’’’*
dtype0
J
strided_slice_2/stackConst*
valueB"        *
dtype0
L
strided_slice_2/stack_1Const*
valueB"       *
dtype0
L
strided_slice_2/stack_2Const*
valueB"      *
dtype0
ń
strided_slice_2StridedSliceaction_holderstrided_slice_2/stackstrided_slice_2/stack_1strided_slice_2/stack_2*
T0*
Index0*
shrink_axis_mask*

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
=
one_hot/on_valueConst*
valueB
 *  ?*
dtype0
>
one_hot/off_valueConst*
valueB
 *    *
dtype0
7
one_hot/depthConst*
value	B :*
dtype0
~
one_hotOneHotstrided_slice_2one_hot/depthone_hot/on_valueone_hot/off_value*
T0*
TI0*
axis’’’’’’’’’
=
concat_3/concat_dimConst*
value	B :*
dtype0
-
concat_3/concatIdentityone_hot*
T0
6
StopGradientStopGradientconcat_3/concat*
T0
K
old_probabilitiesPlaceholder*
shape:’’’’’’’’’*
dtype0
J
strided_slice_3/stackConst*
valueB"        *
dtype0
L
strided_slice_3/stack_1Const*
valueB"       *
dtype0
L
strided_slice_3/stack_2Const*
valueB"      *
dtype0
õ
strided_slice_3StridedSliceold_probabilitiesstrided_slice_3/stackstrided_slice_3/stack_1strided_slice_3/stack_2*
T0*
Index0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
J
strided_slice_4/stackConst*
valueB"        *
dtype0
L
strided_slice_4/stack_1Const*
valueB"       *
dtype0
L
strided_slice_4/stack_2Const*
valueB"      *
dtype0
š
strided_slice_4StridedSliceaction_masksstrided_slice_4/stackstrided_slice_4/stack_1strided_slice_4/stack_2*
T0*
Index0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
.
	Softmax_1Softmaxstrided_slice_3*
T0
4
add_9/yConst*
valueB
 *æÖ3*
dtype0
+
add_9AddV2	Softmax_1add_9/y*
T0
-
Mul_2Muladd_9strided_slice_4*
T0
A
Sum_1/reduction_indicesConst*
value	B :*
dtype0
R
Sum_1SumMul_2Sum_1/reduction_indices*

Tidx0*
	keep_dims(*
T0
+
	truediv_4RealDivMul_2Sum_1*
T0
5
add_10/yConst*
valueB
 *æÖ3*
dtype0
-
add_10AddV2	truediv_4add_10/y*
T0

Log_2Logadd_10*
T0
O
%multinomial_1/Multinomial/num_samplesConst*
value	B :*
dtype0

multinomial_1/MultinomialMultinomialLog_2%multinomial_1/Multinomial/num_samples*
seed»*
output_dtype0	*
T0*
seed2÷
=
concat_4/concat_dimConst*
value	B :*
dtype0
?
concat_4/concatIdentitymultinomial_1/Multinomial*
T0	
=
concat_5/concat_dimConst*
value	B :*
dtype0
/
concat_5/concatIdentity	truediv_4*
T0
5
add_11/yConst*
valueB
 *æÖ3*
dtype0
-
add_11AddV2	truediv_4add_11/y*
T0

Log_3Logadd_11*
T0
=
concat_6/concat_dimConst*
value	B :*
dtype0
+
concat_6/concatIdentityLog_3*
T0
J
strided_slice_5/stackConst*
valueB"        *
dtype0
L
strided_slice_5/stack_1Const*
valueB"       *
dtype0
L
strided_slice_5/stack_2Const*
valueB"      *
dtype0
ż
strided_slice_5StridedSliceaction_probs/action_probsstrided_slice_5/stackstrided_slice_5/stack_1strided_slice_5/stack_2*
T0*
Index0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
.
	Softmax_2Softmaxstrided_slice_5*
T0
J
strided_slice_6/stackConst*
valueB"        *
dtype0
L
strided_slice_6/stack_1Const*
valueB"       *
dtype0
L
strided_slice_6/stack_2Const*
valueB"      *
dtype0
ż
strided_slice_6StridedSliceaction_probs/action_probsstrided_slice_6/stackstrided_slice_6/stack_1strided_slice_6/stack_2*
T0*
Index0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
P
&softmax_cross_entropy_with_logits/RankConst*
value	B :*
dtype0
Z
'softmax_cross_entropy_with_logits/ShapeShapestrided_slice_6*
T0*
out_type0
R
(softmax_cross_entropy_with_logits/Rank_1Const*
value	B :*
dtype0
\
)softmax_cross_entropy_with_logits/Shape_1Shapestrided_slice_6*
T0*
out_type0
Q
'softmax_cross_entropy_with_logits/Sub/yConst*
value	B :*
dtype0

%softmax_cross_entropy_with_logits/SubSub(softmax_cross_entropy_with_logits/Rank_1'softmax_cross_entropy_with_logits/Sub/y*
T0
z
-softmax_cross_entropy_with_logits/Slice/beginPack%softmax_cross_entropy_with_logits/Sub*
T0*

axis *
N
Z
,softmax_cross_entropy_with_logits/Slice/sizeConst*
valueB:*
dtype0
Ī
'softmax_cross_entropy_with_logits/SliceSlice)softmax_cross_entropy_with_logits/Shape_1-softmax_cross_entropy_with_logits/Slice/begin,softmax_cross_entropy_with_logits/Slice/size*
T0*
Index0
h
1softmax_cross_entropy_with_logits/concat/values_0Const*
valueB:
’’’’’’’’’*
dtype0
W
-softmax_cross_entropy_with_logits/concat/axisConst*
value	B : *
dtype0
Ż
(softmax_cross_entropy_with_logits/concatConcatV21softmax_cross_entropy_with_logits/concat/values_0'softmax_cross_entropy_with_logits/Slice-softmax_cross_entropy_with_logits/concat/axis*

Tidx0*
T0*
N

)softmax_cross_entropy_with_logits/ReshapeReshapestrided_slice_6(softmax_cross_entropy_with_logits/concat*
T0*
Tshape0
R
(softmax_cross_entropy_with_logits/Rank_2Const*
value	B :*
dtype0
V
)softmax_cross_entropy_with_logits/Shape_2Shape	Softmax_2*
T0*
out_type0
S
)softmax_cross_entropy_with_logits/Sub_1/yConst*
value	B :*
dtype0

'softmax_cross_entropy_with_logits/Sub_1Sub(softmax_cross_entropy_with_logits/Rank_2)softmax_cross_entropy_with_logits/Sub_1/y*
T0
~
/softmax_cross_entropy_with_logits/Slice_1/beginPack'softmax_cross_entropy_with_logits/Sub_1*
T0*

axis *
N
\
.softmax_cross_entropy_with_logits/Slice_1/sizeConst*
valueB:*
dtype0
Ō
)softmax_cross_entropy_with_logits/Slice_1Slice)softmax_cross_entropy_with_logits/Shape_2/softmax_cross_entropy_with_logits/Slice_1/begin.softmax_cross_entropy_with_logits/Slice_1/size*
T0*
Index0
j
3softmax_cross_entropy_with_logits/concat_1/values_0Const*
valueB:
’’’’’’’’’*
dtype0
Y
/softmax_cross_entropy_with_logits/concat_1/axisConst*
value	B : *
dtype0
å
*softmax_cross_entropy_with_logits/concat_1ConcatV23softmax_cross_entropy_with_logits/concat_1/values_0)softmax_cross_entropy_with_logits/Slice_1/softmax_cross_entropy_with_logits/concat_1/axis*

Tidx0*
T0*
N

+softmax_cross_entropy_with_logits/Reshape_1Reshape	Softmax_2*softmax_cross_entropy_with_logits/concat_1*
T0*
Tshape0
£
!softmax_cross_entropy_with_logitsSoftmaxCrossEntropyWithLogits)softmax_cross_entropy_with_logits/Reshape+softmax_cross_entropy_with_logits/Reshape_1*
T0
S
)softmax_cross_entropy_with_logits/Sub_2/yConst*
value	B :*
dtype0

'softmax_cross_entropy_with_logits/Sub_2Sub&softmax_cross_entropy_with_logits/Rank)softmax_cross_entropy_with_logits/Sub_2/y*
T0
]
/softmax_cross_entropy_with_logits/Slice_2/beginConst*
valueB: *
dtype0
}
.softmax_cross_entropy_with_logits/Slice_2/sizePack'softmax_cross_entropy_with_logits/Sub_2*
T0*

axis *
N
Ņ
)softmax_cross_entropy_with_logits/Slice_2Slice'softmax_cross_entropy_with_logits/Shape/softmax_cross_entropy_with_logits/Slice_2/begin.softmax_cross_entropy_with_logits/Slice_2/size*
T0*
Index0

+softmax_cross_entropy_with_logits/Reshape_2Reshape!softmax_cross_entropy_with_logits)softmax_cross_entropy_with_logits/Slice_2*
T0*
Tshape0
X
stackPack+softmax_cross_entropy_with_logits/Reshape_2*
T0*

axis*
N
A
Sum_2/reduction_indicesConst*
value	B :*
dtype0
R
Sum_2SumstackSum_2/reduction_indices*

Tidx0*
	keep_dims( *
T0
J
strided_slice_7/stackConst*
valueB"        *
dtype0
L
strided_slice_7/stack_1Const*
valueB"       *
dtype0
L
strided_slice_7/stack_2Const*
valueB"      *
dtype0
ó
strided_slice_7StridedSliceconcat_3/concatstrided_slice_7/stackstrided_slice_7/stack_1strided_slice_7/stack_2*
T0*
Index0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
J
strided_slice_8/stackConst*
valueB"        *
dtype0
L
strided_slice_8/stack_1Const*
valueB"       *
dtype0
L
strided_slice_8/stack_2Const*
valueB"      *
dtype0
ó
strided_slice_8StridedSliceconcat_2/concatstrided_slice_8/stackstrided_slice_8/stack_1strided_slice_8/stack_2*
T0*
Index0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
R
(softmax_cross_entropy_with_logits_1/RankConst*
value	B :*
dtype0
\
)softmax_cross_entropy_with_logits_1/ShapeShapestrided_slice_8*
T0*
out_type0
T
*softmax_cross_entropy_with_logits_1/Rank_1Const*
value	B :*
dtype0
^
+softmax_cross_entropy_with_logits_1/Shape_1Shapestrided_slice_8*
T0*
out_type0
S
)softmax_cross_entropy_with_logits_1/Sub/yConst*
value	B :*
dtype0

'softmax_cross_entropy_with_logits_1/SubSub*softmax_cross_entropy_with_logits_1/Rank_1)softmax_cross_entropy_with_logits_1/Sub/y*
T0
~
/softmax_cross_entropy_with_logits_1/Slice/beginPack'softmax_cross_entropy_with_logits_1/Sub*
T0*

axis *
N
\
.softmax_cross_entropy_with_logits_1/Slice/sizeConst*
valueB:*
dtype0
Ö
)softmax_cross_entropy_with_logits_1/SliceSlice+softmax_cross_entropy_with_logits_1/Shape_1/softmax_cross_entropy_with_logits_1/Slice/begin.softmax_cross_entropy_with_logits_1/Slice/size*
T0*
Index0
j
3softmax_cross_entropy_with_logits_1/concat/values_0Const*
valueB:
’’’’’’’’’*
dtype0
Y
/softmax_cross_entropy_with_logits_1/concat/axisConst*
value	B : *
dtype0
å
*softmax_cross_entropy_with_logits_1/concatConcatV23softmax_cross_entropy_with_logits_1/concat/values_0)softmax_cross_entropy_with_logits_1/Slice/softmax_cross_entropy_with_logits_1/concat/axis*

Tidx0*
T0*
N

+softmax_cross_entropy_with_logits_1/ReshapeReshapestrided_slice_8*softmax_cross_entropy_with_logits_1/concat*
T0*
Tshape0
T
*softmax_cross_entropy_with_logits_1/Rank_2Const*
value	B :*
dtype0
^
+softmax_cross_entropy_with_logits_1/Shape_2Shapestrided_slice_7*
T0*
out_type0
U
+softmax_cross_entropy_with_logits_1/Sub_1/yConst*
value	B :*
dtype0

)softmax_cross_entropy_with_logits_1/Sub_1Sub*softmax_cross_entropy_with_logits_1/Rank_2+softmax_cross_entropy_with_logits_1/Sub_1/y*
T0

1softmax_cross_entropy_with_logits_1/Slice_1/beginPack)softmax_cross_entropy_with_logits_1/Sub_1*
T0*

axis *
N
^
0softmax_cross_entropy_with_logits_1/Slice_1/sizeConst*
valueB:*
dtype0
Ü
+softmax_cross_entropy_with_logits_1/Slice_1Slice+softmax_cross_entropy_with_logits_1/Shape_21softmax_cross_entropy_with_logits_1/Slice_1/begin0softmax_cross_entropy_with_logits_1/Slice_1/size*
T0*
Index0
l
5softmax_cross_entropy_with_logits_1/concat_1/values_0Const*
valueB:
’’’’’’’’’*
dtype0
[
1softmax_cross_entropy_with_logits_1/concat_1/axisConst*
value	B : *
dtype0
ķ
,softmax_cross_entropy_with_logits_1/concat_1ConcatV25softmax_cross_entropy_with_logits_1/concat_1/values_0+softmax_cross_entropy_with_logits_1/Slice_11softmax_cross_entropy_with_logits_1/concat_1/axis*

Tidx0*
T0*
N

-softmax_cross_entropy_with_logits_1/Reshape_1Reshapestrided_slice_7,softmax_cross_entropy_with_logits_1/concat_1*
T0*
Tshape0
©
#softmax_cross_entropy_with_logits_1SoftmaxCrossEntropyWithLogits+softmax_cross_entropy_with_logits_1/Reshape-softmax_cross_entropy_with_logits_1/Reshape_1*
T0
U
+softmax_cross_entropy_with_logits_1/Sub_2/yConst*
value	B :*
dtype0

)softmax_cross_entropy_with_logits_1/Sub_2Sub(softmax_cross_entropy_with_logits_1/Rank+softmax_cross_entropy_with_logits_1/Sub_2/y*
T0
_
1softmax_cross_entropy_with_logits_1/Slice_2/beginConst*
valueB: *
dtype0

0softmax_cross_entropy_with_logits_1/Slice_2/sizePack)softmax_cross_entropy_with_logits_1/Sub_2*
T0*

axis *
N
Ś
+softmax_cross_entropy_with_logits_1/Slice_2Slice)softmax_cross_entropy_with_logits_1/Shape1softmax_cross_entropy_with_logits_1/Slice_2/begin0softmax_cross_entropy_with_logits_1/Slice_2/size*
T0*
Index0
”
-softmax_cross_entropy_with_logits_1/Reshape_2Reshape#softmax_cross_entropy_with_logits_1+softmax_cross_entropy_with_logits_1/Slice_2*
T0*
Tshape0
B
NegNeg-softmax_cross_entropy_with_logits_1/Reshape_2*
T0
2
stack_1PackNeg*
T0*

axis*
N
A
Sum_3/reduction_indicesConst*
value	B :*
dtype0
T
Sum_3Sumstack_1Sum_3/reduction_indices*

Tidx0*
	keep_dims(*
T0
J
strided_slice_9/stackConst*
valueB"        *
dtype0
L
strided_slice_9/stack_1Const*
valueB"       *
dtype0
L
strided_slice_9/stack_2Const*
valueB"      *
dtype0
ó
strided_slice_9StridedSliceconcat_3/concatstrided_slice_9/stackstrided_slice_9/stack_1strided_slice_9/stack_2*
T0*
Index0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
K
strided_slice_10/stackConst*
valueB"        *
dtype0
M
strided_slice_10/stack_1Const*
valueB"       *
dtype0
M
strided_slice_10/stack_2Const*
valueB"      *
dtype0
÷
strided_slice_10StridedSliceconcat_6/concatstrided_slice_10/stackstrided_slice_10/stack_1strided_slice_10/stack_2*
T0*
Index0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
R
(softmax_cross_entropy_with_logits_2/RankConst*
value	B :*
dtype0
]
)softmax_cross_entropy_with_logits_2/ShapeShapestrided_slice_10*
T0*
out_type0
T
*softmax_cross_entropy_with_logits_2/Rank_1Const*
value	B :*
dtype0
_
+softmax_cross_entropy_with_logits_2/Shape_1Shapestrided_slice_10*
T0*
out_type0
S
)softmax_cross_entropy_with_logits_2/Sub/yConst*
value	B :*
dtype0

'softmax_cross_entropy_with_logits_2/SubSub*softmax_cross_entropy_with_logits_2/Rank_1)softmax_cross_entropy_with_logits_2/Sub/y*
T0
~
/softmax_cross_entropy_with_logits_2/Slice/beginPack'softmax_cross_entropy_with_logits_2/Sub*
T0*

axis *
N
\
.softmax_cross_entropy_with_logits_2/Slice/sizeConst*
valueB:*
dtype0
Ö
)softmax_cross_entropy_with_logits_2/SliceSlice+softmax_cross_entropy_with_logits_2/Shape_1/softmax_cross_entropy_with_logits_2/Slice/begin.softmax_cross_entropy_with_logits_2/Slice/size*
T0*
Index0
j
3softmax_cross_entropy_with_logits_2/concat/values_0Const*
valueB:
’’’’’’’’’*
dtype0
Y
/softmax_cross_entropy_with_logits_2/concat/axisConst*
value	B : *
dtype0
å
*softmax_cross_entropy_with_logits_2/concatConcatV23softmax_cross_entropy_with_logits_2/concat/values_0)softmax_cross_entropy_with_logits_2/Slice/softmax_cross_entropy_with_logits_2/concat/axis*

Tidx0*
T0*
N

+softmax_cross_entropy_with_logits_2/ReshapeReshapestrided_slice_10*softmax_cross_entropy_with_logits_2/concat*
T0*
Tshape0
T
*softmax_cross_entropy_with_logits_2/Rank_2Const*
value	B :*
dtype0
^
+softmax_cross_entropy_with_logits_2/Shape_2Shapestrided_slice_9*
T0*
out_type0
U
+softmax_cross_entropy_with_logits_2/Sub_1/yConst*
value	B :*
dtype0

)softmax_cross_entropy_with_logits_2/Sub_1Sub*softmax_cross_entropy_with_logits_2/Rank_2+softmax_cross_entropy_with_logits_2/Sub_1/y*
T0

1softmax_cross_entropy_with_logits_2/Slice_1/beginPack)softmax_cross_entropy_with_logits_2/Sub_1*
T0*

axis *
N
^
0softmax_cross_entropy_with_logits_2/Slice_1/sizeConst*
valueB:*
dtype0
Ü
+softmax_cross_entropy_with_logits_2/Slice_1Slice+softmax_cross_entropy_with_logits_2/Shape_21softmax_cross_entropy_with_logits_2/Slice_1/begin0softmax_cross_entropy_with_logits_2/Slice_1/size*
T0*
Index0
l
5softmax_cross_entropy_with_logits_2/concat_1/values_0Const*
valueB:
’’’’’’’’’*
dtype0
[
1softmax_cross_entropy_with_logits_2/concat_1/axisConst*
value	B : *
dtype0
ķ
,softmax_cross_entropy_with_logits_2/concat_1ConcatV25softmax_cross_entropy_with_logits_2/concat_1/values_0+softmax_cross_entropy_with_logits_2/Slice_11softmax_cross_entropy_with_logits_2/concat_1/axis*

Tidx0*
T0*
N

-softmax_cross_entropy_with_logits_2/Reshape_1Reshapestrided_slice_9,softmax_cross_entropy_with_logits_2/concat_1*
T0*
Tshape0
©
#softmax_cross_entropy_with_logits_2SoftmaxCrossEntropyWithLogits+softmax_cross_entropy_with_logits_2/Reshape-softmax_cross_entropy_with_logits_2/Reshape_1*
T0
U
+softmax_cross_entropy_with_logits_2/Sub_2/yConst*
value	B :*
dtype0

)softmax_cross_entropy_with_logits_2/Sub_2Sub(softmax_cross_entropy_with_logits_2/Rank+softmax_cross_entropy_with_logits_2/Sub_2/y*
T0
_
1softmax_cross_entropy_with_logits_2/Slice_2/beginConst*
valueB: *
dtype0

0softmax_cross_entropy_with_logits_2/Slice_2/sizePack)softmax_cross_entropy_with_logits_2/Sub_2*
T0*

axis *
N
Ś
+softmax_cross_entropy_with_logits_2/Slice_2Slice)softmax_cross_entropy_with_logits_2/Shape1softmax_cross_entropy_with_logits_2/Slice_2/begin0softmax_cross_entropy_with_logits_2/Slice_2/size*
T0*
Index0
”
-softmax_cross_entropy_with_logits_2/Reshape_2Reshape#softmax_cross_entropy_with_logits_2+softmax_cross_entropy_with_logits_2/Slice_2*
T0*
Tshape0
D
Neg_1Neg-softmax_cross_entropy_with_logits_2/Reshape_2*
T0
4
stack_2PackNeg_1*
T0*

axis*
N
A
Sum_4/reduction_indicesConst*
value	B :*
dtype0
T
Sum_4Sumstack_2Sum_4/reduction_indices*

Tidx0*
	keep_dims(*
T0
R
%PolynomialDecay/initial_learning_rateConst*
valueB
 *o:*
dtype0
C
PolynomialDecay/Cast/xConst*
valueB
 *’ęŪ.*
dtype0
E
PolynomialDecay/Cast_1/xConst*
valueB
 *  ?*
dtype0
X
PolynomialDecay/Cast_2Castglobal_step/read*

SrcT0*
Truncate( *

DstT0
E
PolynomialDecay/Cast_3/xConst*
valueB
 * $ōH*
dtype0
F
PolynomialDecay/Minimum/yConst*
valueB
 * $ōH*
dtype0
^
PolynomialDecay/MinimumMinimumPolynomialDecay/Cast_2PolynomialDecay/Minimum/y*
T0
^
PolynomialDecay/truedivRealDivPolynomialDecay/MinimumPolynomialDecay/Cast_3/x*
T0
b
PolynomialDecay/subSub%PolynomialDecay/initial_learning_ratePolynomialDecay/Cast/x*
T0
D
PolynomialDecay/sub_1/xConst*
valueB
 *  ?*
dtype0
W
PolynomialDecay/sub_1SubPolynomialDecay/sub_1/xPolynomialDecay/truediv*
T0
T
PolynomialDecay/PowPowPolynomialDecay/sub_1PolynomialDecay/Cast_1/x*
T0
M
PolynomialDecay/MulMulPolynomialDecay/subPolynomialDecay/Pow*
T0
L
PolynomialDecayAddPolynomialDecay/MulPolynomialDecay/Cast/x*
T0
G
extrinsic_returnsPlaceholder*
shape:’’’’’’’’’*
dtype0
N
extrinsic_value_estimatePlaceholder*
shape:’’’’’’’’’*
dtype0
G
curiosity_returnsPlaceholder*
shape:’’’’’’’’’*
dtype0
N
curiosity_value_estimatePlaceholder*
shape:’’’’’’’’’*
dtype0
@

advantagesPlaceholder*
shape:’’’’’’’’’*
dtype0
A
ExpandDims/dimConst*
valueB :
’’’’’’’’’*
dtype0
I

ExpandDims
ExpandDims
advantagesExpandDims/dim*

Tdim0*
T0
T
'PolynomialDecay_1/initial_learning_rateConst*
valueB
 *ĶĢL>*
dtype0
E
PolynomialDecay_1/Cast/xConst*
valueB
 *ĶĢĢ=*
dtype0
G
PolynomialDecay_1/Cast_1/xConst*
valueB
 *  ?*
dtype0
Z
PolynomialDecay_1/Cast_2Castglobal_step/read*

SrcT0*
Truncate( *

DstT0
G
PolynomialDecay_1/Cast_3/xConst*
valueB
 * $ōH*
dtype0
H
PolynomialDecay_1/Minimum/yConst*
valueB
 * $ōH*
dtype0
d
PolynomialDecay_1/MinimumMinimumPolynomialDecay_1/Cast_2PolynomialDecay_1/Minimum/y*
T0
d
PolynomialDecay_1/truedivRealDivPolynomialDecay_1/MinimumPolynomialDecay_1/Cast_3/x*
T0
h
PolynomialDecay_1/subSub'PolynomialDecay_1/initial_learning_ratePolynomialDecay_1/Cast/x*
T0
F
PolynomialDecay_1/sub_1/xConst*
valueB
 *  ?*
dtype0
]
PolynomialDecay_1/sub_1SubPolynomialDecay_1/sub_1/xPolynomialDecay_1/truediv*
T0
Z
PolynomialDecay_1/PowPowPolynomialDecay_1/sub_1PolynomialDecay_1/Cast_1/x*
T0
S
PolynomialDecay_1/MulMulPolynomialDecay_1/subPolynomialDecay_1/Pow*
T0
R
PolynomialDecay_1AddPolynomialDecay_1/MulPolynomialDecay_1/Cast/x*
T0
T
'PolynomialDecay_2/initial_learning_rateConst*
valueB
 *
×#<*
dtype0
E
PolynomialDecay_2/Cast/xConst*
valueB
 *¬Å'7*
dtype0
G
PolynomialDecay_2/Cast_1/xConst*
valueB
 *  ?*
dtype0
Z
PolynomialDecay_2/Cast_2Castglobal_step/read*

SrcT0*
Truncate( *

DstT0
G
PolynomialDecay_2/Cast_3/xConst*
valueB
 * $ōH*
dtype0
H
PolynomialDecay_2/Minimum/yConst*
valueB
 * $ōH*
dtype0
d
PolynomialDecay_2/MinimumMinimumPolynomialDecay_2/Cast_2PolynomialDecay_2/Minimum/y*
T0
d
PolynomialDecay_2/truedivRealDivPolynomialDecay_2/MinimumPolynomialDecay_2/Cast_3/x*
T0
h
PolynomialDecay_2/subSub'PolynomialDecay_2/initial_learning_ratePolynomialDecay_2/Cast/x*
T0
F
PolynomialDecay_2/sub_1/xConst*
valueB
 *  ?*
dtype0
]
PolynomialDecay_2/sub_1SubPolynomialDecay_2/sub_1/xPolynomialDecay_2/truediv*
T0
Z
PolynomialDecay_2/PowPowPolynomialDecay_2/sub_1PolynomialDecay_2/Cast_1/x*
T0
S
PolynomialDecay_2/MulMulPolynomialDecay_2/subPolynomialDecay_2/Pow*
T0
R
PolynomialDecay_2AddPolynomialDecay_2/MulPolynomialDecay_2/Cast/x*
T0
A
Sum_5/reduction_indicesConst*
value	B :*
dtype0
d
Sum_5Sumextrinsic_value/BiasAddSum_5/reduction_indices*

Tidx0*
	keep_dims( *
T0
6
sub_4SubSum_5extrinsic_value_estimate*
T0
(
Neg_2NegPolynomialDecay_1*
T0
C
clip_by_value/MinimumMinimumsub_4PolynomialDecay_1*
T0
?
clip_by_valueMaximumclip_by_value/MinimumNeg_2*
T0
A
add_12AddV2extrinsic_value_estimateclip_by_value*
T0
A
Sum_6/reduction_indicesConst*
value	B :*
dtype0
d
Sum_6Sumextrinsic_value/BiasAddSum_6/reduction_indices*

Tidx0*
	keep_dims( *
T0
I
SquaredDifferenceSquaredDifferenceextrinsic_returnsSum_6*
T0
L
SquaredDifference_1SquaredDifferenceextrinsic_returnsadd_12*
T0
C
MaximumMaximumSquaredDifferenceSquaredDifference_1*
T0
R
DynamicPartitionDynamicPartitionMaximumCast*
num_partitions*
T0
3
ConstConst*
valueB: *
dtype0
O
Mean_2MeanDynamicPartition:1Const*

Tidx0*
	keep_dims( *
T0
A
Sum_7/reduction_indicesConst*
value	B :*
dtype0
d
Sum_7Sumcuriosity_value/BiasAddSum_7/reduction_indices*

Tidx0*
	keep_dims( *
T0
6
sub_5SubSum_7curiosity_value_estimate*
T0
(
Neg_3NegPolynomialDecay_1*
T0
E
clip_by_value_1/MinimumMinimumsub_5PolynomialDecay_1*
T0
C
clip_by_value_1Maximumclip_by_value_1/MinimumNeg_3*
T0
C
add_13AddV2curiosity_value_estimateclip_by_value_1*
T0
A
Sum_8/reduction_indicesConst*
value	B :*
dtype0
d
Sum_8Sumcuriosity_value/BiasAddSum_8/reduction_indices*

Tidx0*
	keep_dims( *
T0
K
SquaredDifference_2SquaredDifferencecuriosity_returnsSum_8*
T0
L
SquaredDifference_3SquaredDifferencecuriosity_returnsadd_13*
T0
G
	Maximum_1MaximumSquaredDifference_2SquaredDifference_3*
T0
V
DynamicPartition_1DynamicPartition	Maximum_1Cast*
num_partitions*
T0
5
Const_1Const*
valueB: *
dtype0
S
Mean_3MeanDynamicPartition_1:1Const_1*

Tidx0*
	keep_dims( *
T0
A
Rank/packedPackMean_2Mean_3*
T0*

axis *
N
.
RankConst*
value	B :*
dtype0
5
range/startConst*
value	B : *
dtype0
5
range/deltaConst*
value	B :*
dtype0
:
rangeRangerange/startRankrange/delta*

Tidx0
B
Mean_4/inputPackMean_2Mean_3*
T0*

axis *
N
I
Mean_4MeanMean_4/inputrange*

Tidx0*
	keep_dims( *
T0
#
sub_6SubSum_3Sum_4*
T0

ExpExpsub_6*
T0
&
mul_3MulExp
ExpandDims*
T0
4
sub_7/xConst*
valueB
 *  ?*
dtype0
1
sub_7Subsub_7/xPolynomialDecay_1*
T0
5
add_14/xConst*
valueB
 *  ?*
dtype0
5
add_14AddV2add_14/xPolynomialDecay_1*
T0
8
clip_by_value_2/MinimumMinimumExpadd_14*
T0
C
clip_by_value_2Maximumclip_by_value_2/Minimumsub_7*
T0
2
mul_4Mulclip_by_value_2
ExpandDims*
T0
)
MinimumMinimummul_3mul_4*
T0
T
DynamicPartition_2DynamicPartitionMinimumCast*
num_partitions*
T0
<
Const_2Const*
valueB"       *
dtype0
S
Mean_5MeanDynamicPartition_2:1Const_2*

Tidx0*
	keep_dims( *
T0

Neg_4NegMean_5*
T0

AbsAbsNeg_4*
T0
4
mul_5/xConst*
valueB
 *   ?*
dtype0
&
mul_5Mulmul_5/xMean_4*
T0
&
add_15AddV2Neg_4mul_5*
T0
R
DynamicPartition_3DynamicPartitionSum_2Cast*
num_partitions*
T0
5
Const_3Const*
valueB: *
dtype0
S
Mean_6MeanDynamicPartition_3:1Const_3*

Tidx0*
	keep_dims( *
T0
0
mul_6MulPolynomialDecay_2Mean_6*
T0
$
sub_8Subadd_15mul_6*
T0
8
gradients/ShapeConst*
valueB *
dtype0
@
gradients/grad_ys_0Const*
valueB
 *  ?*
dtype0
W
gradients/FillFillgradients/Shapegradients/grad_ys_0*
T0*

index_type0
8
gradients/sub_8_grad/NegNeggradients/Fill*
T0
Y
%gradients/sub_8_grad/tuple/group_depsNoOp^gradients/Fill^gradients/sub_8_grad/Neg

-gradients/sub_8_grad/tuple/control_dependencyIdentitygradients/Fill&^gradients/sub_8_grad/tuple/group_deps*
T0*!
_class
loc:@gradients/Fill
³
/gradients/sub_8_grad/tuple/control_dependency_1Identitygradients/sub_8_grad/Neg&^gradients/sub_8_grad/tuple/group_deps*
T0*+
_class!
loc:@gradients/sub_8_grad/Neg
^
&gradients/add_15_grad/tuple/group_depsNoOp.^gradients/sub_8_grad/tuple/control_dependency
¾
.gradients/add_15_grad/tuple/control_dependencyIdentity-gradients/sub_8_grad/tuple/control_dependency'^gradients/add_15_grad/tuple/group_deps*
T0*!
_class
loc:@gradients/Fill
Ą
0gradients/add_15_grad/tuple/control_dependency_1Identity-gradients/sub_8_grad/tuple/control_dependency'^gradients/add_15_grad/tuple/group_deps*
T0*!
_class
loc:@gradients/Fill
a
gradients/mul_6_grad/MulMul/gradients/sub_8_grad/tuple/control_dependency_1Mean_6*
T0
n
gradients/mul_6_grad/Mul_1Mul/gradients/sub_8_grad/tuple/control_dependency_1PolynomialDecay_2*
T0
e
%gradients/mul_6_grad/tuple/group_depsNoOp^gradients/mul_6_grad/Mul^gradients/mul_6_grad/Mul_1
±
-gradients/mul_6_grad/tuple/control_dependencyIdentitygradients/mul_6_grad/Mul&^gradients/mul_6_grad/tuple/group_deps*
T0*+
_class!
loc:@gradients/mul_6_grad/Mul
·
/gradients/mul_6_grad/tuple/control_dependency_1Identitygradients/mul_6_grad/Mul_1&^gradients/mul_6_grad/tuple/group_deps*
T0*-
_class#
!loc:@gradients/mul_6_grad/Mul_1
X
gradients/Neg_4_grad/NegNeg.gradients/add_15_grad/tuple/control_dependency*
T0
b
gradients/mul_5_grad/MulMul0gradients/add_15_grad/tuple/control_dependency_1Mean_4*
T0
e
gradients/mul_5_grad/Mul_1Mul0gradients/add_15_grad/tuple/control_dependency_1mul_5/x*
T0
e
%gradients/mul_5_grad/tuple/group_depsNoOp^gradients/mul_5_grad/Mul^gradients/mul_5_grad/Mul_1
±
-gradients/mul_5_grad/tuple/control_dependencyIdentitygradients/mul_5_grad/Mul&^gradients/mul_5_grad/tuple/group_deps*
T0*+
_class!
loc:@gradients/mul_5_grad/Mul
·
/gradients/mul_5_grad/tuple/control_dependency_1Identitygradients/mul_5_grad/Mul_1&^gradients/mul_5_grad/tuple/group_deps*
T0*-
_class#
!loc:@gradients/mul_5_grad/Mul_1
Q
#gradients/Mean_6_grad/Reshape/shapeConst*
valueB:*
dtype0

gradients/Mean_6_grad/ReshapeReshape/gradients/mul_6_grad/tuple/control_dependency_1#gradients/Mean_6_grad/Reshape/shape*
T0*
Tshape0
S
gradients/Mean_6_grad/ShapeShapeDynamicPartition_3:1*
T0*
out_type0
y
gradients/Mean_6_grad/TileTilegradients/Mean_6_grad/Reshapegradients/Mean_6_grad/Shape*

Tmultiples0*
T0
U
gradients/Mean_6_grad/Shape_1ShapeDynamicPartition_3:1*
T0*
out_type0
F
gradients/Mean_6_grad/Shape_2Const*
valueB *
dtype0
I
gradients/Mean_6_grad/ConstConst*
valueB: *
dtype0

gradients/Mean_6_grad/ProdProdgradients/Mean_6_grad/Shape_1gradients/Mean_6_grad/Const*

Tidx0*
	keep_dims( *
T0
K
gradients/Mean_6_grad/Const_1Const*
valueB: *
dtype0

gradients/Mean_6_grad/Prod_1Prodgradients/Mean_6_grad/Shape_2gradients/Mean_6_grad/Const_1*

Tidx0*
	keep_dims( *
T0
I
gradients/Mean_6_grad/Maximum/yConst*
value	B :*
dtype0
p
gradients/Mean_6_grad/MaximumMaximumgradients/Mean_6_grad/Prod_1gradients/Mean_6_grad/Maximum/y*
T0
n
gradients/Mean_6_grad/floordivFloorDivgradients/Mean_6_grad/Prodgradients/Mean_6_grad/Maximum*
T0
j
gradients/Mean_6_grad/CastCastgradients/Mean_6_grad/floordiv*

SrcT0*
Truncate( *

DstT0
i
gradients/Mean_6_grad/truedivRealDivgradients/Mean_6_grad/Tilegradients/Mean_6_grad/Cast*
T0
X
#gradients/Mean_5_grad/Reshape/shapeConst*
valueB"      *
dtype0
~
gradients/Mean_5_grad/ReshapeReshapegradients/Neg_4_grad/Neg#gradients/Mean_5_grad/Reshape/shape*
T0*
Tshape0
S
gradients/Mean_5_grad/ShapeShapeDynamicPartition_2:1*
T0*
out_type0
y
gradients/Mean_5_grad/TileTilegradients/Mean_5_grad/Reshapegradients/Mean_5_grad/Shape*

Tmultiples0*
T0
U
gradients/Mean_5_grad/Shape_1ShapeDynamicPartition_2:1*
T0*
out_type0
F
gradients/Mean_5_grad/Shape_2Const*
valueB *
dtype0
I
gradients/Mean_5_grad/ConstConst*
valueB: *
dtype0

gradients/Mean_5_grad/ProdProdgradients/Mean_5_grad/Shape_1gradients/Mean_5_grad/Const*

Tidx0*
	keep_dims( *
T0
K
gradients/Mean_5_grad/Const_1Const*
valueB: *
dtype0

gradients/Mean_5_grad/Prod_1Prodgradients/Mean_5_grad/Shape_2gradients/Mean_5_grad/Const_1*

Tidx0*
	keep_dims( *
T0
I
gradients/Mean_5_grad/Maximum/yConst*
value	B :*
dtype0
p
gradients/Mean_5_grad/MaximumMaximumgradients/Mean_5_grad/Prod_1gradients/Mean_5_grad/Maximum/y*
T0
n
gradients/Mean_5_grad/floordivFloorDivgradients/Mean_5_grad/Prodgradients/Mean_5_grad/Maximum*
T0
j
gradients/Mean_5_grad/CastCastgradients/Mean_5_grad/floordiv*

SrcT0*
Truncate( *

DstT0
i
gradients/Mean_5_grad/truedivRealDivgradients/Mean_5_grad/Tilegradients/Mean_5_grad/Cast*
T0
Q
#gradients/Mean_4_grad/Reshape/shapeConst*
valueB:*
dtype0

gradients/Mean_4_grad/ReshapeReshape/gradients/mul_5_grad/tuple/control_dependency_1#gradients/Mean_4_grad/Reshape/shape*
T0*
Tshape0
I
gradients/Mean_4_grad/ConstConst*
valueB:*
dtype0
y
gradients/Mean_4_grad/TileTilegradients/Mean_4_grad/Reshapegradients/Mean_4_grad/Const*

Tmultiples0*
T0
J
gradients/Mean_4_grad/Const_1Const*
valueB
 *   @*
dtype0
l
gradients/Mean_4_grad/truedivRealDivgradients/Mean_4_grad/Tilegradients/Mean_4_grad/Const_1*
T0
>
gradients/zeros_like	ZerosLikeDynamicPartition_3*
T0
O
'gradients/DynamicPartition_3_grad/ShapeShapeCast*
T0*
out_type0
U
'gradients/DynamicPartition_3_grad/ConstConst*
valueB: *
dtype0
¦
&gradients/DynamicPartition_3_grad/ProdProd'gradients/DynamicPartition_3_grad/Shape'gradients/DynamicPartition_3_grad/Const*

Tidx0*
	keep_dims( *
T0
W
-gradients/DynamicPartition_3_grad/range/startConst*
value	B : *
dtype0
W
-gradients/DynamicPartition_3_grad/range/deltaConst*
value	B :*
dtype0
Ā
'gradients/DynamicPartition_3_grad/rangeRange-gradients/DynamicPartition_3_grad/range/start&gradients/DynamicPartition_3_grad/Prod-gradients/DynamicPartition_3_grad/range/delta*

Tidx0

)gradients/DynamicPartition_3_grad/ReshapeReshape'gradients/DynamicPartition_3_grad/range'gradients/DynamicPartition_3_grad/Shape*
T0*
Tshape0

2gradients/DynamicPartition_3_grad/DynamicPartitionDynamicPartition)gradients/DynamicPartition_3_grad/ReshapeCast*
num_partitions*
T0
ń
/gradients/DynamicPartition_3_grad/DynamicStitchDynamicStitch2gradients/DynamicPartition_3_grad/DynamicPartition4gradients/DynamicPartition_3_grad/DynamicPartition:1gradients/zeros_likegradients/Mean_6_grad/truediv*
T0*
N
R
)gradients/DynamicPartition_3_grad/Shape_1ShapeSum_2*
T0*
out_type0
©
+gradients/DynamicPartition_3_grad/Reshape_1Reshape/gradients/DynamicPartition_3_grad/DynamicStitch)gradients/DynamicPartition_3_grad/Shape_1*
T0*
Tshape0
@
gradients/zeros_like_1	ZerosLikeDynamicPartition_2*
T0
O
'gradients/DynamicPartition_2_grad/ShapeShapeCast*
T0*
out_type0
U
'gradients/DynamicPartition_2_grad/ConstConst*
valueB: *
dtype0
¦
&gradients/DynamicPartition_2_grad/ProdProd'gradients/DynamicPartition_2_grad/Shape'gradients/DynamicPartition_2_grad/Const*

Tidx0*
	keep_dims( *
T0
W
-gradients/DynamicPartition_2_grad/range/startConst*
value	B : *
dtype0
W
-gradients/DynamicPartition_2_grad/range/deltaConst*
value	B :*
dtype0
Ā
'gradients/DynamicPartition_2_grad/rangeRange-gradients/DynamicPartition_2_grad/range/start&gradients/DynamicPartition_2_grad/Prod-gradients/DynamicPartition_2_grad/range/delta*

Tidx0

)gradients/DynamicPartition_2_grad/ReshapeReshape'gradients/DynamicPartition_2_grad/range'gradients/DynamicPartition_2_grad/Shape*
T0*
Tshape0

2gradients/DynamicPartition_2_grad/DynamicPartitionDynamicPartition)gradients/DynamicPartition_2_grad/ReshapeCast*
num_partitions*
T0
ó
/gradients/DynamicPartition_2_grad/DynamicStitchDynamicStitch2gradients/DynamicPartition_2_grad/DynamicPartition4gradients/DynamicPartition_2_grad/DynamicPartition:1gradients/zeros_like_1gradients/Mean_5_grad/truediv*
T0*
N
T
)gradients/DynamicPartition_2_grad/Shape_1ShapeMinimum*
T0*
out_type0
©
+gradients/DynamicPartition_2_grad/Reshape_1Reshape/gradients/DynamicPartition_2_grad/DynamicStitch)gradients/DynamicPartition_2_grad/Shape_1*
T0*
Tshape0
l
#gradients/Mean_4/input_grad/unstackUnpackgradients/Mean_4_grad/truediv*
T0*	
num*

axis 
Z
,gradients/Mean_4/input_grad/tuple/group_depsNoOp$^gradients/Mean_4/input_grad/unstack
Õ
4gradients/Mean_4/input_grad/tuple/control_dependencyIdentity#gradients/Mean_4/input_grad/unstack-^gradients/Mean_4/input_grad/tuple/group_deps*
T0*6
_class,
*(loc:@gradients/Mean_4/input_grad/unstack
Ł
6gradients/Mean_4/input_grad/tuple/control_dependency_1Identity%gradients/Mean_4/input_grad/unstack:1-^gradients/Mean_4/input_grad/tuple/group_deps*
T0*6
_class,
*(loc:@gradients/Mean_4/input_grad/unstack
C
gradients/Sum_2_grad/ShapeShapestack*
T0*
out_type0
r
gradients/Sum_2_grad/SizeConst*-
_class#
!loc:@gradients/Sum_2_grad/Shape*
value	B :*
dtype0

gradients/Sum_2_grad/addAddV2Sum_2/reduction_indicesgradients/Sum_2_grad/Size*
T0*-
_class#
!loc:@gradients/Sum_2_grad/Shape

gradients/Sum_2_grad/modFloorModgradients/Sum_2_grad/addgradients/Sum_2_grad/Size*
T0*-
_class#
!loc:@gradients/Sum_2_grad/Shape
t
gradients/Sum_2_grad/Shape_1Const*-
_class#
!loc:@gradients/Sum_2_grad/Shape*
valueB *
dtype0
y
 gradients/Sum_2_grad/range/startConst*-
_class#
!loc:@gradients/Sum_2_grad/Shape*
value	B : *
dtype0
y
 gradients/Sum_2_grad/range/deltaConst*-
_class#
!loc:@gradients/Sum_2_grad/Shape*
value	B :*
dtype0
½
gradients/Sum_2_grad/rangeRange gradients/Sum_2_grad/range/startgradients/Sum_2_grad/Size gradients/Sum_2_grad/range/delta*

Tidx0*-
_class#
!loc:@gradients/Sum_2_grad/Shape
x
gradients/Sum_2_grad/Fill/valueConst*-
_class#
!loc:@gradients/Sum_2_grad/Shape*
value	B :*
dtype0
Ŗ
gradients/Sum_2_grad/FillFillgradients/Sum_2_grad/Shape_1gradients/Sum_2_grad/Fill/value*
T0*-
_class#
!loc:@gradients/Sum_2_grad/Shape*

index_type0
į
"gradients/Sum_2_grad/DynamicStitchDynamicStitchgradients/Sum_2_grad/rangegradients/Sum_2_grad/modgradients/Sum_2_grad/Shapegradients/Sum_2_grad/Fill*
T0*-
_class#
!loc:@gradients/Sum_2_grad/Shape*
N
w
gradients/Sum_2_grad/Maximum/yConst*-
_class#
!loc:@gradients/Sum_2_grad/Shape*
value	B :*
dtype0
£
gradients/Sum_2_grad/MaximumMaximum"gradients/Sum_2_grad/DynamicStitchgradients/Sum_2_grad/Maximum/y*
T0*-
_class#
!loc:@gradients/Sum_2_grad/Shape

gradients/Sum_2_grad/floordivFloorDivgradients/Sum_2_grad/Shapegradients/Sum_2_grad/Maximum*
T0*-
_class#
!loc:@gradients/Sum_2_grad/Shape

gradients/Sum_2_grad/ReshapeReshape+gradients/DynamicPartition_3_grad/Reshape_1"gradients/Sum_2_grad/DynamicStitch*
T0*
Tshape0
y
gradients/Sum_2_grad/TileTilegradients/Sum_2_grad/Reshapegradients/Sum_2_grad/floordiv*

Tmultiples0*
T0
E
gradients/Minimum_grad/ShapeShapemul_3*
T0*
out_type0
G
gradients/Minimum_grad/Shape_1Shapemul_4*
T0*
out_type0
m
gradients/Minimum_grad/Shape_2Shape+gradients/DynamicPartition_2_grad/Reshape_1*
T0*
out_type0
O
"gradients/Minimum_grad/zeros/ConstConst*
valueB
 *    *
dtype0

gradients/Minimum_grad/zerosFillgradients/Minimum_grad/Shape_2"gradients/Minimum_grad/zeros/Const*
T0*

index_type0
D
 gradients/Minimum_grad/LessEqual	LessEqualmul_3mul_4*
T0

,gradients/Minimum_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/Minimum_grad/Shapegradients/Minimum_grad/Shape_1*
T0

gradients/Minimum_grad/SelectSelect gradients/Minimum_grad/LessEqual+gradients/DynamicPartition_2_grad/Reshape_1gradients/Minimum_grad/zeros*
T0

gradients/Minimum_grad/SumSumgradients/Minimum_grad/Select,gradients/Minimum_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
z
gradients/Minimum_grad/ReshapeReshapegradients/Minimum_grad/Sumgradients/Minimum_grad/Shape*
T0*
Tshape0

gradients/Minimum_grad/Select_1Select gradients/Minimum_grad/LessEqualgradients/Minimum_grad/zeros+gradients/DynamicPartition_2_grad/Reshape_1*
T0

gradients/Minimum_grad/Sum_1Sumgradients/Minimum_grad/Select_1.gradients/Minimum_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0

 gradients/Minimum_grad/Reshape_1Reshapegradients/Minimum_grad/Sum_1gradients/Minimum_grad/Shape_1*
T0*
Tshape0
s
'gradients/Minimum_grad/tuple/group_depsNoOp^gradients/Minimum_grad/Reshape!^gradients/Minimum_grad/Reshape_1
Į
/gradients/Minimum_grad/tuple/control_dependencyIdentitygradients/Minimum_grad/Reshape(^gradients/Minimum_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/Minimum_grad/Reshape
Ē
1gradients/Minimum_grad/tuple/control_dependency_1Identity gradients/Minimum_grad/Reshape_1(^gradients/Minimum_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients/Minimum_grad/Reshape_1
Q
#gradients/Mean_2_grad/Reshape/shapeConst*
valueB:*
dtype0

gradients/Mean_2_grad/ReshapeReshape4gradients/Mean_4/input_grad/tuple/control_dependency#gradients/Mean_2_grad/Reshape/shape*
T0*
Tshape0
Q
gradients/Mean_2_grad/ShapeShapeDynamicPartition:1*
T0*
out_type0
y
gradients/Mean_2_grad/TileTilegradients/Mean_2_grad/Reshapegradients/Mean_2_grad/Shape*

Tmultiples0*
T0
S
gradients/Mean_2_grad/Shape_1ShapeDynamicPartition:1*
T0*
out_type0
F
gradients/Mean_2_grad/Shape_2Const*
valueB *
dtype0
I
gradients/Mean_2_grad/ConstConst*
valueB: *
dtype0

gradients/Mean_2_grad/ProdProdgradients/Mean_2_grad/Shape_1gradients/Mean_2_grad/Const*

Tidx0*
	keep_dims( *
T0
K
gradients/Mean_2_grad/Const_1Const*
valueB: *
dtype0

gradients/Mean_2_grad/Prod_1Prodgradients/Mean_2_grad/Shape_2gradients/Mean_2_grad/Const_1*

Tidx0*
	keep_dims( *
T0
I
gradients/Mean_2_grad/Maximum/yConst*
value	B :*
dtype0
p
gradients/Mean_2_grad/MaximumMaximumgradients/Mean_2_grad/Prod_1gradients/Mean_2_grad/Maximum/y*
T0
n
gradients/Mean_2_grad/floordivFloorDivgradients/Mean_2_grad/Prodgradients/Mean_2_grad/Maximum*
T0
j
gradients/Mean_2_grad/CastCastgradients/Mean_2_grad/floordiv*

SrcT0*
Truncate( *

DstT0
i
gradients/Mean_2_grad/truedivRealDivgradients/Mean_2_grad/Tilegradients/Mean_2_grad/Cast*
T0
Q
#gradients/Mean_3_grad/Reshape/shapeConst*
valueB:*
dtype0

gradients/Mean_3_grad/ReshapeReshape6gradients/Mean_4/input_grad/tuple/control_dependency_1#gradients/Mean_3_grad/Reshape/shape*
T0*
Tshape0
S
gradients/Mean_3_grad/ShapeShapeDynamicPartition_1:1*
T0*
out_type0
y
gradients/Mean_3_grad/TileTilegradients/Mean_3_grad/Reshapegradients/Mean_3_grad/Shape*

Tmultiples0*
T0
U
gradients/Mean_3_grad/Shape_1ShapeDynamicPartition_1:1*
T0*
out_type0
F
gradients/Mean_3_grad/Shape_2Const*
valueB *
dtype0
I
gradients/Mean_3_grad/ConstConst*
valueB: *
dtype0

gradients/Mean_3_grad/ProdProdgradients/Mean_3_grad/Shape_1gradients/Mean_3_grad/Const*

Tidx0*
	keep_dims( *
T0
K
gradients/Mean_3_grad/Const_1Const*
valueB: *
dtype0

gradients/Mean_3_grad/Prod_1Prodgradients/Mean_3_grad/Shape_2gradients/Mean_3_grad/Const_1*

Tidx0*
	keep_dims( *
T0
I
gradients/Mean_3_grad/Maximum/yConst*
value	B :*
dtype0
p
gradients/Mean_3_grad/MaximumMaximumgradients/Mean_3_grad/Prod_1gradients/Mean_3_grad/Maximum/y*
T0
n
gradients/Mean_3_grad/floordivFloorDivgradients/Mean_3_grad/Prodgradients/Mean_3_grad/Maximum*
T0
j
gradients/Mean_3_grad/CastCastgradients/Mean_3_grad/floordiv*

SrcT0*
Truncate( *

DstT0
i
gradients/Mean_3_grad/truedivRealDivgradients/Mean_3_grad/Tilegradients/Mean_3_grad/Cast*
T0
a
gradients/stack_grad/unstackUnpackgradients/Sum_2_grad/Tile*
T0*	
num*

axis
A
gradients/mul_3_grad/ShapeShapeExp*
T0*
out_type0
J
gradients/mul_3_grad/Shape_1Shape
ExpandDims*
T0*
out_type0

*gradients/mul_3_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/mul_3_grad/Shapegradients/mul_3_grad/Shape_1*
T0
e
gradients/mul_3_grad/MulMul/gradients/Minimum_grad/tuple/control_dependency
ExpandDims*
T0

gradients/mul_3_grad/SumSumgradients/mul_3_grad/Mul*gradients/mul_3_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
t
gradients/mul_3_grad/ReshapeReshapegradients/mul_3_grad/Sumgradients/mul_3_grad/Shape*
T0*
Tshape0
`
gradients/mul_3_grad/Mul_1MulExp/gradients/Minimum_grad/tuple/control_dependency*
T0

gradients/mul_3_grad/Sum_1Sumgradients/mul_3_grad/Mul_1,gradients/mul_3_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
z
gradients/mul_3_grad/Reshape_1Reshapegradients/mul_3_grad/Sum_1gradients/mul_3_grad/Shape_1*
T0*
Tshape0
m
%gradients/mul_3_grad/tuple/group_depsNoOp^gradients/mul_3_grad/Reshape^gradients/mul_3_grad/Reshape_1
¹
-gradients/mul_3_grad/tuple/control_dependencyIdentitygradients/mul_3_grad/Reshape&^gradients/mul_3_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/mul_3_grad/Reshape
æ
/gradients/mul_3_grad/tuple/control_dependency_1Identitygradients/mul_3_grad/Reshape_1&^gradients/mul_3_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/mul_3_grad/Reshape_1
M
gradients/mul_4_grad/ShapeShapeclip_by_value_2*
T0*
out_type0
J
gradients/mul_4_grad/Shape_1Shape
ExpandDims*
T0*
out_type0

*gradients/mul_4_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/mul_4_grad/Shapegradients/mul_4_grad/Shape_1*
T0
g
gradients/mul_4_grad/MulMul1gradients/Minimum_grad/tuple/control_dependency_1
ExpandDims*
T0

gradients/mul_4_grad/SumSumgradients/mul_4_grad/Mul*gradients/mul_4_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
t
gradients/mul_4_grad/ReshapeReshapegradients/mul_4_grad/Sumgradients/mul_4_grad/Shape*
T0*
Tshape0
n
gradients/mul_4_grad/Mul_1Mulclip_by_value_21gradients/Minimum_grad/tuple/control_dependency_1*
T0

gradients/mul_4_grad/Sum_1Sumgradients/mul_4_grad/Mul_1,gradients/mul_4_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
z
gradients/mul_4_grad/Reshape_1Reshapegradients/mul_4_grad/Sum_1gradients/mul_4_grad/Shape_1*
T0*
Tshape0
m
%gradients/mul_4_grad/tuple/group_depsNoOp^gradients/mul_4_grad/Reshape^gradients/mul_4_grad/Reshape_1
¹
-gradients/mul_4_grad/tuple/control_dependencyIdentitygradients/mul_4_grad/Reshape&^gradients/mul_4_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/mul_4_grad/Reshape
æ
/gradients/mul_4_grad/tuple/control_dependency_1Identitygradients/mul_4_grad/Reshape_1&^gradients/mul_4_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/mul_4_grad/Reshape_1
>
gradients/zeros_like_2	ZerosLikeDynamicPartition*
T0
M
%gradients/DynamicPartition_grad/ShapeShapeCast*
T0*
out_type0
S
%gradients/DynamicPartition_grad/ConstConst*
valueB: *
dtype0
 
$gradients/DynamicPartition_grad/ProdProd%gradients/DynamicPartition_grad/Shape%gradients/DynamicPartition_grad/Const*

Tidx0*
	keep_dims( *
T0
U
+gradients/DynamicPartition_grad/range/startConst*
value	B : *
dtype0
U
+gradients/DynamicPartition_grad/range/deltaConst*
value	B :*
dtype0
ŗ
%gradients/DynamicPartition_grad/rangeRange+gradients/DynamicPartition_grad/range/start$gradients/DynamicPartition_grad/Prod+gradients/DynamicPartition_grad/range/delta*

Tidx0

'gradients/DynamicPartition_grad/ReshapeReshape%gradients/DynamicPartition_grad/range%gradients/DynamicPartition_grad/Shape*
T0*
Tshape0

0gradients/DynamicPartition_grad/DynamicPartitionDynamicPartition'gradients/DynamicPartition_grad/ReshapeCast*
num_partitions*
T0
ķ
-gradients/DynamicPartition_grad/DynamicStitchDynamicStitch0gradients/DynamicPartition_grad/DynamicPartition2gradients/DynamicPartition_grad/DynamicPartition:1gradients/zeros_like_2gradients/Mean_2_grad/truediv*
T0*
N
R
'gradients/DynamicPartition_grad/Shape_1ShapeMaximum*
T0*
out_type0
£
)gradients/DynamicPartition_grad/Reshape_1Reshape-gradients/DynamicPartition_grad/DynamicStitch'gradients/DynamicPartition_grad/Shape_1*
T0*
Tshape0
@
gradients/zeros_like_3	ZerosLikeDynamicPartition_1*
T0
O
'gradients/DynamicPartition_1_grad/ShapeShapeCast*
T0*
out_type0
U
'gradients/DynamicPartition_1_grad/ConstConst*
valueB: *
dtype0
¦
&gradients/DynamicPartition_1_grad/ProdProd'gradients/DynamicPartition_1_grad/Shape'gradients/DynamicPartition_1_grad/Const*

Tidx0*
	keep_dims( *
T0
W
-gradients/DynamicPartition_1_grad/range/startConst*
value	B : *
dtype0
W
-gradients/DynamicPartition_1_grad/range/deltaConst*
value	B :*
dtype0
Ā
'gradients/DynamicPartition_1_grad/rangeRange-gradients/DynamicPartition_1_grad/range/start&gradients/DynamicPartition_1_grad/Prod-gradients/DynamicPartition_1_grad/range/delta*

Tidx0

)gradients/DynamicPartition_1_grad/ReshapeReshape'gradients/DynamicPartition_1_grad/range'gradients/DynamicPartition_1_grad/Shape*
T0*
Tshape0

2gradients/DynamicPartition_1_grad/DynamicPartitionDynamicPartition)gradients/DynamicPartition_1_grad/ReshapeCast*
num_partitions*
T0
ó
/gradients/DynamicPartition_1_grad/DynamicStitchDynamicStitch2gradients/DynamicPartition_1_grad/DynamicPartition4gradients/DynamicPartition_1_grad/DynamicPartition:1gradients/zeros_like_3gradients/Mean_3_grad/truediv*
T0*
N
V
)gradients/DynamicPartition_1_grad/Shape_1Shape	Maximum_1*
T0*
out_type0
©
+gradients/DynamicPartition_1_grad/Reshape_1Reshape/gradients/DynamicPartition_1_grad/DynamicStitch)gradients/DynamicPartition_1_grad/Shape_1*
T0*
Tshape0

@gradients/softmax_cross_entropy_with_logits/Reshape_2_grad/ShapeShape!softmax_cross_entropy_with_logits*
T0*
out_type0
Ä
Bgradients/softmax_cross_entropy_with_logits/Reshape_2_grad/ReshapeReshapegradients/stack_grad/unstack@gradients/softmax_cross_entropy_with_logits/Reshape_2_grad/Shape*
T0*
Tshape0
_
$gradients/clip_by_value_2_grad/ShapeShapeclip_by_value_2/Minimum*
T0*
out_type0
O
&gradients/clip_by_value_2_grad/Shape_1Const*
valueB *
dtype0
w
&gradients/clip_by_value_2_grad/Shape_2Shape-gradients/mul_4_grad/tuple/control_dependency*
T0*
out_type0
W
*gradients/clip_by_value_2_grad/zeros/ConstConst*
valueB
 *    *
dtype0

$gradients/clip_by_value_2_grad/zerosFill&gradients/clip_by_value_2_grad/Shape_2*gradients/clip_by_value_2_grad/zeros/Const*
T0*

index_type0
d
+gradients/clip_by_value_2_grad/GreaterEqualGreaterEqualclip_by_value_2/Minimumsub_7*
T0
¤
4gradients/clip_by_value_2_grad/BroadcastGradientArgsBroadcastGradientArgs$gradients/clip_by_value_2_grad/Shape&gradients/clip_by_value_2_grad/Shape_1*
T0
ŗ
%gradients/clip_by_value_2_grad/SelectSelect+gradients/clip_by_value_2_grad/GreaterEqual-gradients/mul_4_grad/tuple/control_dependency$gradients/clip_by_value_2_grad/zeros*
T0
¬
"gradients/clip_by_value_2_grad/SumSum%gradients/clip_by_value_2_grad/Select4gradients/clip_by_value_2_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0

&gradients/clip_by_value_2_grad/ReshapeReshape"gradients/clip_by_value_2_grad/Sum$gradients/clip_by_value_2_grad/Shape*
T0*
Tshape0
¼
'gradients/clip_by_value_2_grad/Select_1Select+gradients/clip_by_value_2_grad/GreaterEqual$gradients/clip_by_value_2_grad/zeros-gradients/mul_4_grad/tuple/control_dependency*
T0
²
$gradients/clip_by_value_2_grad/Sum_1Sum'gradients/clip_by_value_2_grad/Select_16gradients/clip_by_value_2_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0

(gradients/clip_by_value_2_grad/Reshape_1Reshape$gradients/clip_by_value_2_grad/Sum_1&gradients/clip_by_value_2_grad/Shape_1*
T0*
Tshape0

/gradients/clip_by_value_2_grad/tuple/group_depsNoOp'^gradients/clip_by_value_2_grad/Reshape)^gradients/clip_by_value_2_grad/Reshape_1
į
7gradients/clip_by_value_2_grad/tuple/control_dependencyIdentity&gradients/clip_by_value_2_grad/Reshape0^gradients/clip_by_value_2_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients/clip_by_value_2_grad/Reshape
ē
9gradients/clip_by_value_2_grad/tuple/control_dependency_1Identity(gradients/clip_by_value_2_grad/Reshape_10^gradients/clip_by_value_2_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients/clip_by_value_2_grad/Reshape_1
Q
gradients/Maximum_grad/ShapeShapeSquaredDifference*
T0*
out_type0
U
gradients/Maximum_grad/Shape_1ShapeSquaredDifference_1*
T0*
out_type0
k
gradients/Maximum_grad/Shape_2Shape)gradients/DynamicPartition_grad/Reshape_1*
T0*
out_type0
O
"gradients/Maximum_grad/zeros/ConstConst*
valueB
 *    *
dtype0

gradients/Maximum_grad/zerosFillgradients/Maximum_grad/Shape_2"gradients/Maximum_grad/zeros/Const*
T0*

index_type0
d
#gradients/Maximum_grad/GreaterEqualGreaterEqualSquaredDifferenceSquaredDifference_1*
T0

,gradients/Maximum_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/Maximum_grad/Shapegradients/Maximum_grad/Shape_1*
T0

gradients/Maximum_grad/SelectSelect#gradients/Maximum_grad/GreaterEqual)gradients/DynamicPartition_grad/Reshape_1gradients/Maximum_grad/zeros*
T0

gradients/Maximum_grad/SumSumgradients/Maximum_grad/Select,gradients/Maximum_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
z
gradients/Maximum_grad/ReshapeReshapegradients/Maximum_grad/Sumgradients/Maximum_grad/Shape*
T0*
Tshape0
 
gradients/Maximum_grad/Select_1Select#gradients/Maximum_grad/GreaterEqualgradients/Maximum_grad/zeros)gradients/DynamicPartition_grad/Reshape_1*
T0

gradients/Maximum_grad/Sum_1Sumgradients/Maximum_grad/Select_1.gradients/Maximum_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0

 gradients/Maximum_grad/Reshape_1Reshapegradients/Maximum_grad/Sum_1gradients/Maximum_grad/Shape_1*
T0*
Tshape0
s
'gradients/Maximum_grad/tuple/group_depsNoOp^gradients/Maximum_grad/Reshape!^gradients/Maximum_grad/Reshape_1
Į
/gradients/Maximum_grad/tuple/control_dependencyIdentitygradients/Maximum_grad/Reshape(^gradients/Maximum_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/Maximum_grad/Reshape
Ē
1gradients/Maximum_grad/tuple/control_dependency_1Identity gradients/Maximum_grad/Reshape_1(^gradients/Maximum_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients/Maximum_grad/Reshape_1
U
gradients/Maximum_1_grad/ShapeShapeSquaredDifference_2*
T0*
out_type0
W
 gradients/Maximum_1_grad/Shape_1ShapeSquaredDifference_3*
T0*
out_type0
o
 gradients/Maximum_1_grad/Shape_2Shape+gradients/DynamicPartition_1_grad/Reshape_1*
T0*
out_type0
Q
$gradients/Maximum_1_grad/zeros/ConstConst*
valueB
 *    *
dtype0

gradients/Maximum_1_grad/zerosFill gradients/Maximum_1_grad/Shape_2$gradients/Maximum_1_grad/zeros/Const*
T0*

index_type0
h
%gradients/Maximum_1_grad/GreaterEqualGreaterEqualSquaredDifference_2SquaredDifference_3*
T0

.gradients/Maximum_1_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/Maximum_1_grad/Shape gradients/Maximum_1_grad/Shape_1*
T0
¦
gradients/Maximum_1_grad/SelectSelect%gradients/Maximum_1_grad/GreaterEqual+gradients/DynamicPartition_1_grad/Reshape_1gradients/Maximum_1_grad/zeros*
T0

gradients/Maximum_1_grad/SumSumgradients/Maximum_1_grad/Select.gradients/Maximum_1_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0

 gradients/Maximum_1_grad/ReshapeReshapegradients/Maximum_1_grad/Sumgradients/Maximum_1_grad/Shape*
T0*
Tshape0
Ø
!gradients/Maximum_1_grad/Select_1Select%gradients/Maximum_1_grad/GreaterEqualgradients/Maximum_1_grad/zeros+gradients/DynamicPartition_1_grad/Reshape_1*
T0
 
gradients/Maximum_1_grad/Sum_1Sum!gradients/Maximum_1_grad/Select_10gradients/Maximum_1_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0

"gradients/Maximum_1_grad/Reshape_1Reshapegradients/Maximum_1_grad/Sum_1 gradients/Maximum_1_grad/Shape_1*
T0*
Tshape0
y
)gradients/Maximum_1_grad/tuple/group_depsNoOp!^gradients/Maximum_1_grad/Reshape#^gradients/Maximum_1_grad/Reshape_1
É
1gradients/Maximum_1_grad/tuple/control_dependencyIdentity gradients/Maximum_1_grad/Reshape*^gradients/Maximum_1_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients/Maximum_1_grad/Reshape
Ļ
3gradients/Maximum_1_grad/tuple/control_dependency_1Identity"gradients/Maximum_1_grad/Reshape_1*^gradients/Maximum_1_grad/tuple/group_deps*
T0*5
_class+
)'loc:@gradients/Maximum_1_grad/Reshape_1
Q
gradients/zeros_like_4	ZerosLike#softmax_cross_entropy_with_logits:1*
T0
r
?gradients/softmax_cross_entropy_with_logits_grad/ExpandDims/dimConst*
valueB :
’’’’’’’’’*
dtype0
ć
;gradients/softmax_cross_entropy_with_logits_grad/ExpandDims
ExpandDimsBgradients/softmax_cross_entropy_with_logits/Reshape_2_grad/Reshape?gradients/softmax_cross_entropy_with_logits_grad/ExpandDims/dim*

Tdim0*
T0
¦
4gradients/softmax_cross_entropy_with_logits_grad/mulMul;gradients/softmax_cross_entropy_with_logits_grad/ExpandDims#softmax_cross_entropy_with_logits:1*
T0
}
;gradients/softmax_cross_entropy_with_logits_grad/LogSoftmax
LogSoftmax)softmax_cross_entropy_with_logits/Reshape*
T0

4gradients/softmax_cross_entropy_with_logits_grad/NegNeg;gradients/softmax_cross_entropy_with_logits_grad/LogSoftmax*
T0
t
Agradients/softmax_cross_entropy_with_logits_grad/ExpandDims_1/dimConst*
valueB :
’’’’’’’’’*
dtype0
ē
=gradients/softmax_cross_entropy_with_logits_grad/ExpandDims_1
ExpandDimsBgradients/softmax_cross_entropy_with_logits/Reshape_2_grad/ReshapeAgradients/softmax_cross_entropy_with_logits_grad/ExpandDims_1/dim*

Tdim0*
T0
»
6gradients/softmax_cross_entropy_with_logits_grad/mul_1Mul=gradients/softmax_cross_entropy_with_logits_grad/ExpandDims_14gradients/softmax_cross_entropy_with_logits_grad/Neg*
T0
¹
Agradients/softmax_cross_entropy_with_logits_grad/tuple/group_depsNoOp5^gradients/softmax_cross_entropy_with_logits_grad/mul7^gradients/softmax_cross_entropy_with_logits_grad/mul_1
”
Igradients/softmax_cross_entropy_with_logits_grad/tuple/control_dependencyIdentity4gradients/softmax_cross_entropy_with_logits_grad/mulB^gradients/softmax_cross_entropy_with_logits_grad/tuple/group_deps*
T0*G
_class=
;9loc:@gradients/softmax_cross_entropy_with_logits_grad/mul
§
Kgradients/softmax_cross_entropy_with_logits_grad/tuple/control_dependency_1Identity6gradients/softmax_cross_entropy_with_logits_grad/mul_1B^gradients/softmax_cross_entropy_with_logits_grad/tuple/group_deps*
T0*I
_class?
=;loc:@gradients/softmax_cross_entropy_with_logits_grad/mul_1
S
,gradients/clip_by_value_2/Minimum_grad/ShapeShapeExp*
T0*
out_type0
W
.gradients/clip_by_value_2/Minimum_grad/Shape_1Const*
valueB *
dtype0

.gradients/clip_by_value_2/Minimum_grad/Shape_2Shape7gradients/clip_by_value_2_grad/tuple/control_dependency*
T0*
out_type0
_
2gradients/clip_by_value_2/Minimum_grad/zeros/ConstConst*
valueB
 *    *
dtype0
³
,gradients/clip_by_value_2/Minimum_grad/zerosFill.gradients/clip_by_value_2/Minimum_grad/Shape_22gradients/clip_by_value_2/Minimum_grad/zeros/Const*
T0*

index_type0
S
0gradients/clip_by_value_2/Minimum_grad/LessEqual	LessEqualExpadd_14*
T0
¼
<gradients/clip_by_value_2/Minimum_grad/BroadcastGradientArgsBroadcastGradientArgs,gradients/clip_by_value_2/Minimum_grad/Shape.gradients/clip_by_value_2/Minimum_grad/Shape_1*
T0
Ł
-gradients/clip_by_value_2/Minimum_grad/SelectSelect0gradients/clip_by_value_2/Minimum_grad/LessEqual7gradients/clip_by_value_2_grad/tuple/control_dependency,gradients/clip_by_value_2/Minimum_grad/zeros*
T0
Ä
*gradients/clip_by_value_2/Minimum_grad/SumSum-gradients/clip_by_value_2/Minimum_grad/Select<gradients/clip_by_value_2/Minimum_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
Ŗ
.gradients/clip_by_value_2/Minimum_grad/ReshapeReshape*gradients/clip_by_value_2/Minimum_grad/Sum,gradients/clip_by_value_2/Minimum_grad/Shape*
T0*
Tshape0
Ū
/gradients/clip_by_value_2/Minimum_grad/Select_1Select0gradients/clip_by_value_2/Minimum_grad/LessEqual,gradients/clip_by_value_2/Minimum_grad/zeros7gradients/clip_by_value_2_grad/tuple/control_dependency*
T0
Ź
,gradients/clip_by_value_2/Minimum_grad/Sum_1Sum/gradients/clip_by_value_2/Minimum_grad/Select_1>gradients/clip_by_value_2/Minimum_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
°
0gradients/clip_by_value_2/Minimum_grad/Reshape_1Reshape,gradients/clip_by_value_2/Minimum_grad/Sum_1.gradients/clip_by_value_2/Minimum_grad/Shape_1*
T0*
Tshape0
£
7gradients/clip_by_value_2/Minimum_grad/tuple/group_depsNoOp/^gradients/clip_by_value_2/Minimum_grad/Reshape1^gradients/clip_by_value_2/Minimum_grad/Reshape_1

?gradients/clip_by_value_2/Minimum_grad/tuple/control_dependencyIdentity.gradients/clip_by_value_2/Minimum_grad/Reshape8^gradients/clip_by_value_2/Minimum_grad/tuple/group_deps*
T0*A
_class7
53loc:@gradients/clip_by_value_2/Minimum_grad/Reshape

Agradients/clip_by_value_2/Minimum_grad/tuple/control_dependency_1Identity0gradients/clip_by_value_2/Minimum_grad/Reshape_18^gradients/clip_by_value_2/Minimum_grad/tuple/group_deps*
T0*C
_class9
75loc:@gradients/clip_by_value_2/Minimum_grad/Reshape_1

'gradients/SquaredDifference_grad/scalarConst0^gradients/Maximum_grad/tuple/control_dependency*
valueB
 *   @*
dtype0

$gradients/SquaredDifference_grad/MulMul'gradients/SquaredDifference_grad/scalar/gradients/Maximum_grad/tuple/control_dependency*
T0

$gradients/SquaredDifference_grad/subSubextrinsic_returnsSum_60^gradients/Maximum_grad/tuple/control_dependency*
T0

&gradients/SquaredDifference_grad/mul_1Mul$gradients/SquaredDifference_grad/Mul$gradients/SquaredDifference_grad/sub*
T0
[
&gradients/SquaredDifference_grad/ShapeShapeextrinsic_returns*
T0*
out_type0
Q
(gradients/SquaredDifference_grad/Shape_1ShapeSum_6*
T0*
out_type0
Ŗ
6gradients/SquaredDifference_grad/BroadcastGradientArgsBroadcastGradientArgs&gradients/SquaredDifference_grad/Shape(gradients/SquaredDifference_grad/Shape_1*
T0
±
$gradients/SquaredDifference_grad/SumSum&gradients/SquaredDifference_grad/mul_16gradients/SquaredDifference_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0

(gradients/SquaredDifference_grad/ReshapeReshape$gradients/SquaredDifference_grad/Sum&gradients/SquaredDifference_grad/Shape*
T0*
Tshape0
µ
&gradients/SquaredDifference_grad/Sum_1Sum&gradients/SquaredDifference_grad/mul_18gradients/SquaredDifference_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0

*gradients/SquaredDifference_grad/Reshape_1Reshape&gradients/SquaredDifference_grad/Sum_1(gradients/SquaredDifference_grad/Shape_1*
T0*
Tshape0
`
$gradients/SquaredDifference_grad/NegNeg*gradients/SquaredDifference_grad/Reshape_1*
T0

1gradients/SquaredDifference_grad/tuple/group_depsNoOp%^gradients/SquaredDifference_grad/Neg)^gradients/SquaredDifference_grad/Reshape
é
9gradients/SquaredDifference_grad/tuple/control_dependencyIdentity(gradients/SquaredDifference_grad/Reshape2^gradients/SquaredDifference_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients/SquaredDifference_grad/Reshape
ć
;gradients/SquaredDifference_grad/tuple/control_dependency_1Identity$gradients/SquaredDifference_grad/Neg2^gradients/SquaredDifference_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients/SquaredDifference_grad/Neg

)gradients/SquaredDifference_1_grad/scalarConst2^gradients/Maximum_grad/tuple/control_dependency_1*
valueB
 *   @*
dtype0

&gradients/SquaredDifference_1_grad/MulMul)gradients/SquaredDifference_1_grad/scalar1gradients/Maximum_grad/tuple/control_dependency_1*
T0

&gradients/SquaredDifference_1_grad/subSubextrinsic_returnsadd_122^gradients/Maximum_grad/tuple/control_dependency_1*
T0

(gradients/SquaredDifference_1_grad/mul_1Mul&gradients/SquaredDifference_1_grad/Mul&gradients/SquaredDifference_1_grad/sub*
T0
]
(gradients/SquaredDifference_1_grad/ShapeShapeextrinsic_returns*
T0*
out_type0
T
*gradients/SquaredDifference_1_grad/Shape_1Shapeadd_12*
T0*
out_type0
°
8gradients/SquaredDifference_1_grad/BroadcastGradientArgsBroadcastGradientArgs(gradients/SquaredDifference_1_grad/Shape*gradients/SquaredDifference_1_grad/Shape_1*
T0
·
&gradients/SquaredDifference_1_grad/SumSum(gradients/SquaredDifference_1_grad/mul_18gradients/SquaredDifference_1_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0

*gradients/SquaredDifference_1_grad/ReshapeReshape&gradients/SquaredDifference_1_grad/Sum(gradients/SquaredDifference_1_grad/Shape*
T0*
Tshape0
»
(gradients/SquaredDifference_1_grad/Sum_1Sum(gradients/SquaredDifference_1_grad/mul_1:gradients/SquaredDifference_1_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
¤
,gradients/SquaredDifference_1_grad/Reshape_1Reshape(gradients/SquaredDifference_1_grad/Sum_1*gradients/SquaredDifference_1_grad/Shape_1*
T0*
Tshape0
d
&gradients/SquaredDifference_1_grad/NegNeg,gradients/SquaredDifference_1_grad/Reshape_1*
T0

3gradients/SquaredDifference_1_grad/tuple/group_depsNoOp'^gradients/SquaredDifference_1_grad/Neg+^gradients/SquaredDifference_1_grad/Reshape
ń
;gradients/SquaredDifference_1_grad/tuple/control_dependencyIdentity*gradients/SquaredDifference_1_grad/Reshape4^gradients/SquaredDifference_1_grad/tuple/group_deps*
T0*=
_class3
1/loc:@gradients/SquaredDifference_1_grad/Reshape
ė
=gradients/SquaredDifference_1_grad/tuple/control_dependency_1Identity&gradients/SquaredDifference_1_grad/Neg4^gradients/SquaredDifference_1_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients/SquaredDifference_1_grad/Neg

)gradients/SquaredDifference_2_grad/scalarConst2^gradients/Maximum_1_grad/tuple/control_dependency*
valueB
 *   @*
dtype0

&gradients/SquaredDifference_2_grad/MulMul)gradients/SquaredDifference_2_grad/scalar1gradients/Maximum_1_grad/tuple/control_dependency*
T0

&gradients/SquaredDifference_2_grad/subSubcuriosity_returnsSum_82^gradients/Maximum_1_grad/tuple/control_dependency*
T0

(gradients/SquaredDifference_2_grad/mul_1Mul&gradients/SquaredDifference_2_grad/Mul&gradients/SquaredDifference_2_grad/sub*
T0
]
(gradients/SquaredDifference_2_grad/ShapeShapecuriosity_returns*
T0*
out_type0
S
*gradients/SquaredDifference_2_grad/Shape_1ShapeSum_8*
T0*
out_type0
°
8gradients/SquaredDifference_2_grad/BroadcastGradientArgsBroadcastGradientArgs(gradients/SquaredDifference_2_grad/Shape*gradients/SquaredDifference_2_grad/Shape_1*
T0
·
&gradients/SquaredDifference_2_grad/SumSum(gradients/SquaredDifference_2_grad/mul_18gradients/SquaredDifference_2_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0

*gradients/SquaredDifference_2_grad/ReshapeReshape&gradients/SquaredDifference_2_grad/Sum(gradients/SquaredDifference_2_grad/Shape*
T0*
Tshape0
»
(gradients/SquaredDifference_2_grad/Sum_1Sum(gradients/SquaredDifference_2_grad/mul_1:gradients/SquaredDifference_2_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
¤
,gradients/SquaredDifference_2_grad/Reshape_1Reshape(gradients/SquaredDifference_2_grad/Sum_1*gradients/SquaredDifference_2_grad/Shape_1*
T0*
Tshape0
d
&gradients/SquaredDifference_2_grad/NegNeg,gradients/SquaredDifference_2_grad/Reshape_1*
T0

3gradients/SquaredDifference_2_grad/tuple/group_depsNoOp'^gradients/SquaredDifference_2_grad/Neg+^gradients/SquaredDifference_2_grad/Reshape
ń
;gradients/SquaredDifference_2_grad/tuple/control_dependencyIdentity*gradients/SquaredDifference_2_grad/Reshape4^gradients/SquaredDifference_2_grad/tuple/group_deps*
T0*=
_class3
1/loc:@gradients/SquaredDifference_2_grad/Reshape
ė
=gradients/SquaredDifference_2_grad/tuple/control_dependency_1Identity&gradients/SquaredDifference_2_grad/Neg4^gradients/SquaredDifference_2_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients/SquaredDifference_2_grad/Neg

)gradients/SquaredDifference_3_grad/scalarConst4^gradients/Maximum_1_grad/tuple/control_dependency_1*
valueB
 *   @*
dtype0

&gradients/SquaredDifference_3_grad/MulMul)gradients/SquaredDifference_3_grad/scalar3gradients/Maximum_1_grad/tuple/control_dependency_1*
T0

&gradients/SquaredDifference_3_grad/subSubcuriosity_returnsadd_134^gradients/Maximum_1_grad/tuple/control_dependency_1*
T0

(gradients/SquaredDifference_3_grad/mul_1Mul&gradients/SquaredDifference_3_grad/Mul&gradients/SquaredDifference_3_grad/sub*
T0
]
(gradients/SquaredDifference_3_grad/ShapeShapecuriosity_returns*
T0*
out_type0
T
*gradients/SquaredDifference_3_grad/Shape_1Shapeadd_13*
T0*
out_type0
°
8gradients/SquaredDifference_3_grad/BroadcastGradientArgsBroadcastGradientArgs(gradients/SquaredDifference_3_grad/Shape*gradients/SquaredDifference_3_grad/Shape_1*
T0
·
&gradients/SquaredDifference_3_grad/SumSum(gradients/SquaredDifference_3_grad/mul_18gradients/SquaredDifference_3_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0

*gradients/SquaredDifference_3_grad/ReshapeReshape&gradients/SquaredDifference_3_grad/Sum(gradients/SquaredDifference_3_grad/Shape*
T0*
Tshape0
»
(gradients/SquaredDifference_3_grad/Sum_1Sum(gradients/SquaredDifference_3_grad/mul_1:gradients/SquaredDifference_3_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
¤
,gradients/SquaredDifference_3_grad/Reshape_1Reshape(gradients/SquaredDifference_3_grad/Sum_1*gradients/SquaredDifference_3_grad/Shape_1*
T0*
Tshape0
d
&gradients/SquaredDifference_3_grad/NegNeg,gradients/SquaredDifference_3_grad/Reshape_1*
T0

3gradients/SquaredDifference_3_grad/tuple/group_depsNoOp'^gradients/SquaredDifference_3_grad/Neg+^gradients/SquaredDifference_3_grad/Reshape
ń
;gradients/SquaredDifference_3_grad/tuple/control_dependencyIdentity*gradients/SquaredDifference_3_grad/Reshape4^gradients/SquaredDifference_3_grad/tuple/group_deps*
T0*=
_class3
1/loc:@gradients/SquaredDifference_3_grad/Reshape
ė
=gradients/SquaredDifference_3_grad/tuple/control_dependency_1Identity&gradients/SquaredDifference_3_grad/Neg4^gradients/SquaredDifference_3_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients/SquaredDifference_3_grad/Neg
q
>gradients/softmax_cross_entropy_with_logits/Reshape_grad/ShapeShapestrided_slice_6*
T0*
out_type0
ķ
@gradients/softmax_cross_entropy_with_logits/Reshape_grad/ReshapeReshapeIgradients/softmax_cross_entropy_with_logits_grad/tuple/control_dependency>gradients/softmax_cross_entropy_with_logits/Reshape_grad/Shape*
T0*
Tshape0
m
@gradients/softmax_cross_entropy_with_logits/Reshape_1_grad/ShapeShape	Softmax_2*
T0*
out_type0
ó
Bgradients/softmax_cross_entropy_with_logits/Reshape_1_grad/ReshapeReshapeKgradients/softmax_cross_entropy_with_logits_grad/tuple/control_dependency_1@gradients/softmax_cross_entropy_with_logits/Reshape_1_grad/Shape*
T0*
Tshape0
É
gradients/AddNAddN-gradients/mul_3_grad/tuple/control_dependency?gradients/clip_by_value_2/Minimum_grad/tuple/control_dependency*
T0*/
_class%
#!loc:@gradients/mul_3_grad/Reshape*
N
;
gradients/Exp_grad/mulMulgradients/AddNExp*
T0
U
gradients/Sum_6_grad/ShapeShapeextrinsic_value/BiasAdd*
T0*
out_type0
r
gradients/Sum_6_grad/SizeConst*-
_class#
!loc:@gradients/Sum_6_grad/Shape*
value	B :*
dtype0

gradients/Sum_6_grad/addAddV2Sum_6/reduction_indicesgradients/Sum_6_grad/Size*
T0*-
_class#
!loc:@gradients/Sum_6_grad/Shape

gradients/Sum_6_grad/modFloorModgradients/Sum_6_grad/addgradients/Sum_6_grad/Size*
T0*-
_class#
!loc:@gradients/Sum_6_grad/Shape
t
gradients/Sum_6_grad/Shape_1Const*-
_class#
!loc:@gradients/Sum_6_grad/Shape*
valueB *
dtype0
y
 gradients/Sum_6_grad/range/startConst*-
_class#
!loc:@gradients/Sum_6_grad/Shape*
value	B : *
dtype0
y
 gradients/Sum_6_grad/range/deltaConst*-
_class#
!loc:@gradients/Sum_6_grad/Shape*
value	B :*
dtype0
½
gradients/Sum_6_grad/rangeRange gradients/Sum_6_grad/range/startgradients/Sum_6_grad/Size gradients/Sum_6_grad/range/delta*

Tidx0*-
_class#
!loc:@gradients/Sum_6_grad/Shape
x
gradients/Sum_6_grad/Fill/valueConst*-
_class#
!loc:@gradients/Sum_6_grad/Shape*
value	B :*
dtype0
Ŗ
gradients/Sum_6_grad/FillFillgradients/Sum_6_grad/Shape_1gradients/Sum_6_grad/Fill/value*
T0*-
_class#
!loc:@gradients/Sum_6_grad/Shape*

index_type0
į
"gradients/Sum_6_grad/DynamicStitchDynamicStitchgradients/Sum_6_grad/rangegradients/Sum_6_grad/modgradients/Sum_6_grad/Shapegradients/Sum_6_grad/Fill*
T0*-
_class#
!loc:@gradients/Sum_6_grad/Shape*
N
w
gradients/Sum_6_grad/Maximum/yConst*-
_class#
!loc:@gradients/Sum_6_grad/Shape*
value	B :*
dtype0
£
gradients/Sum_6_grad/MaximumMaximum"gradients/Sum_6_grad/DynamicStitchgradients/Sum_6_grad/Maximum/y*
T0*-
_class#
!loc:@gradients/Sum_6_grad/Shape

gradients/Sum_6_grad/floordivFloorDivgradients/Sum_6_grad/Shapegradients/Sum_6_grad/Maximum*
T0*-
_class#
!loc:@gradients/Sum_6_grad/Shape

gradients/Sum_6_grad/ReshapeReshape;gradients/SquaredDifference_grad/tuple/control_dependency_1"gradients/Sum_6_grad/DynamicStitch*
T0*
Tshape0
y
gradients/Sum_6_grad/TileTilegradients/Sum_6_grad/Reshapegradients/Sum_6_grad/floordiv*

Tmultiples0*
T0
W
gradients/add_12_grad/ShapeShapeextrinsic_value_estimate*
T0*
out_type0
N
gradients/add_12_grad/Shape_1Shapeclip_by_value*
T0*
out_type0

+gradients/add_12_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/add_12_grad/Shapegradients/add_12_grad/Shape_1*
T0
²
gradients/add_12_grad/SumSum=gradients/SquaredDifference_1_grad/tuple/control_dependency_1+gradients/add_12_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
w
gradients/add_12_grad/ReshapeReshapegradients/add_12_grad/Sumgradients/add_12_grad/Shape*
T0*
Tshape0
¶
gradients/add_12_grad/Sum_1Sum=gradients/SquaredDifference_1_grad/tuple/control_dependency_1-gradients/add_12_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
}
gradients/add_12_grad/Reshape_1Reshapegradients/add_12_grad/Sum_1gradients/add_12_grad/Shape_1*
T0*
Tshape0
p
&gradients/add_12_grad/tuple/group_depsNoOp^gradients/add_12_grad/Reshape ^gradients/add_12_grad/Reshape_1
½
.gradients/add_12_grad/tuple/control_dependencyIdentitygradients/add_12_grad/Reshape'^gradients/add_12_grad/tuple/group_deps*
T0*0
_class&
$"loc:@gradients/add_12_grad/Reshape
Ć
0gradients/add_12_grad/tuple/control_dependency_1Identitygradients/add_12_grad/Reshape_1'^gradients/add_12_grad/tuple/group_deps*
T0*2
_class(
&$loc:@gradients/add_12_grad/Reshape_1
U
gradients/Sum_8_grad/ShapeShapecuriosity_value/BiasAdd*
T0*
out_type0
r
gradients/Sum_8_grad/SizeConst*-
_class#
!loc:@gradients/Sum_8_grad/Shape*
value	B :*
dtype0

gradients/Sum_8_grad/addAddV2Sum_8/reduction_indicesgradients/Sum_8_grad/Size*
T0*-
_class#
!loc:@gradients/Sum_8_grad/Shape

gradients/Sum_8_grad/modFloorModgradients/Sum_8_grad/addgradients/Sum_8_grad/Size*
T0*-
_class#
!loc:@gradients/Sum_8_grad/Shape
t
gradients/Sum_8_grad/Shape_1Const*-
_class#
!loc:@gradients/Sum_8_grad/Shape*
valueB *
dtype0
y
 gradients/Sum_8_grad/range/startConst*-
_class#
!loc:@gradients/Sum_8_grad/Shape*
value	B : *
dtype0
y
 gradients/Sum_8_grad/range/deltaConst*-
_class#
!loc:@gradients/Sum_8_grad/Shape*
value	B :*
dtype0
½
gradients/Sum_8_grad/rangeRange gradients/Sum_8_grad/range/startgradients/Sum_8_grad/Size gradients/Sum_8_grad/range/delta*

Tidx0*-
_class#
!loc:@gradients/Sum_8_grad/Shape
x
gradients/Sum_8_grad/Fill/valueConst*-
_class#
!loc:@gradients/Sum_8_grad/Shape*
value	B :*
dtype0
Ŗ
gradients/Sum_8_grad/FillFillgradients/Sum_8_grad/Shape_1gradients/Sum_8_grad/Fill/value*
T0*-
_class#
!loc:@gradients/Sum_8_grad/Shape*

index_type0
į
"gradients/Sum_8_grad/DynamicStitchDynamicStitchgradients/Sum_8_grad/rangegradients/Sum_8_grad/modgradients/Sum_8_grad/Shapegradients/Sum_8_grad/Fill*
T0*-
_class#
!loc:@gradients/Sum_8_grad/Shape*
N
w
gradients/Sum_8_grad/Maximum/yConst*-
_class#
!loc:@gradients/Sum_8_grad/Shape*
value	B :*
dtype0
£
gradients/Sum_8_grad/MaximumMaximum"gradients/Sum_8_grad/DynamicStitchgradients/Sum_8_grad/Maximum/y*
T0*-
_class#
!loc:@gradients/Sum_8_grad/Shape

gradients/Sum_8_grad/floordivFloorDivgradients/Sum_8_grad/Shapegradients/Sum_8_grad/Maximum*
T0*-
_class#
!loc:@gradients/Sum_8_grad/Shape
”
gradients/Sum_8_grad/ReshapeReshape=gradients/SquaredDifference_2_grad/tuple/control_dependency_1"gradients/Sum_8_grad/DynamicStitch*
T0*
Tshape0
y
gradients/Sum_8_grad/TileTilegradients/Sum_8_grad/Reshapegradients/Sum_8_grad/floordiv*

Tmultiples0*
T0
W
gradients/add_13_grad/ShapeShapecuriosity_value_estimate*
T0*
out_type0
P
gradients/add_13_grad/Shape_1Shapeclip_by_value_1*
T0*
out_type0

+gradients/add_13_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/add_13_grad/Shapegradients/add_13_grad/Shape_1*
T0
²
gradients/add_13_grad/SumSum=gradients/SquaredDifference_3_grad/tuple/control_dependency_1+gradients/add_13_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
w
gradients/add_13_grad/ReshapeReshapegradients/add_13_grad/Sumgradients/add_13_grad/Shape*
T0*
Tshape0
¶
gradients/add_13_grad/Sum_1Sum=gradients/SquaredDifference_3_grad/tuple/control_dependency_1-gradients/add_13_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
}
gradients/add_13_grad/Reshape_1Reshapegradients/add_13_grad/Sum_1gradients/add_13_grad/Shape_1*
T0*
Tshape0
p
&gradients/add_13_grad/tuple/group_depsNoOp^gradients/add_13_grad/Reshape ^gradients/add_13_grad/Reshape_1
½
.gradients/add_13_grad/tuple/control_dependencyIdentitygradients/add_13_grad/Reshape'^gradients/add_13_grad/tuple/group_deps*
T0*0
_class&
$"loc:@gradients/add_13_grad/Reshape
Ć
0gradients/add_13_grad/tuple/control_dependency_1Identitygradients/add_13_grad/Reshape_1'^gradients/add_13_grad/tuple/group_deps*
T0*2
_class(
&$loc:@gradients/add_13_grad/Reshape_1
a
$gradients/strided_slice_6_grad/ShapeShapeaction_probs/action_probs*
T0*
out_type0
ī
/gradients/strided_slice_6_grad/StridedSliceGradStridedSliceGrad$gradients/strided_slice_6_grad/Shapestrided_slice_6/stackstrided_slice_6/stack_1strided_slice_6/stack_2@gradients/softmax_cross_entropy_with_logits/Reshape_grad/Reshape*
Index0*
T0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
{
gradients/Softmax_2_grad/mulMulBgradients/softmax_cross_entropy_with_logits/Reshape_1_grad/Reshape	Softmax_2*
T0
a
.gradients/Softmax_2_grad/Sum/reduction_indicesConst*
valueB :
’’’’’’’’’*
dtype0

gradients/Softmax_2_grad/SumSumgradients/Softmax_2_grad/mul.gradients/Softmax_2_grad/Sum/reduction_indices*

Tidx0*
	keep_dims(*
T0

gradients/Softmax_2_grad/subSubBgradients/softmax_cross_entropy_with_logits/Reshape_1_grad/Reshapegradients/Softmax_2_grad/Sum*
T0
W
gradients/Softmax_2_grad/mul_1Mulgradients/Softmax_2_grad/sub	Softmax_2*
T0
C
gradients/sub_6_grad/ShapeShapeSum_3*
T0*
out_type0
E
gradients/sub_6_grad/Shape_1ShapeSum_4*
T0*
out_type0

*gradients/sub_6_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/sub_6_grad/Shapegradients/sub_6_grad/Shape_1*
T0

gradients/sub_6_grad/SumSumgradients/Exp_grad/mul*gradients/sub_6_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
t
gradients/sub_6_grad/ReshapeReshapegradients/sub_6_grad/Sumgradients/sub_6_grad/Shape*
T0*
Tshape0
@
gradients/sub_6_grad/NegNeggradients/Exp_grad/mul*
T0

gradients/sub_6_grad/Sum_1Sumgradients/sub_6_grad/Neg,gradients/sub_6_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
z
gradients/sub_6_grad/Reshape_1Reshapegradients/sub_6_grad/Sum_1gradients/sub_6_grad/Shape_1*
T0*
Tshape0
m
%gradients/sub_6_grad/tuple/group_depsNoOp^gradients/sub_6_grad/Reshape^gradients/sub_6_grad/Reshape_1
¹
-gradients/sub_6_grad/tuple/control_dependencyIdentitygradients/sub_6_grad/Reshape&^gradients/sub_6_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/sub_6_grad/Reshape
æ
/gradients/sub_6_grad/tuple/control_dependency_1Identitygradients/sub_6_grad/Reshape_1&^gradients/sub_6_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/sub_6_grad/Reshape_1
[
"gradients/clip_by_value_grad/ShapeShapeclip_by_value/Minimum*
T0*
out_type0
M
$gradients/clip_by_value_grad/Shape_1Const*
valueB *
dtype0
x
$gradients/clip_by_value_grad/Shape_2Shape0gradients/add_12_grad/tuple/control_dependency_1*
T0*
out_type0
U
(gradients/clip_by_value_grad/zeros/ConstConst*
valueB
 *    *
dtype0

"gradients/clip_by_value_grad/zerosFill$gradients/clip_by_value_grad/Shape_2(gradients/clip_by_value_grad/zeros/Const*
T0*

index_type0
`
)gradients/clip_by_value_grad/GreaterEqualGreaterEqualclip_by_value/MinimumNeg_2*
T0

2gradients/clip_by_value_grad/BroadcastGradientArgsBroadcastGradientArgs"gradients/clip_by_value_grad/Shape$gradients/clip_by_value_grad/Shape_1*
T0
·
#gradients/clip_by_value_grad/SelectSelect)gradients/clip_by_value_grad/GreaterEqual0gradients/add_12_grad/tuple/control_dependency_1"gradients/clip_by_value_grad/zeros*
T0
¦
 gradients/clip_by_value_grad/SumSum#gradients/clip_by_value_grad/Select2gradients/clip_by_value_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0

$gradients/clip_by_value_grad/ReshapeReshape gradients/clip_by_value_grad/Sum"gradients/clip_by_value_grad/Shape*
T0*
Tshape0
¹
%gradients/clip_by_value_grad/Select_1Select)gradients/clip_by_value_grad/GreaterEqual"gradients/clip_by_value_grad/zeros0gradients/add_12_grad/tuple/control_dependency_1*
T0
¬
"gradients/clip_by_value_grad/Sum_1Sum%gradients/clip_by_value_grad/Select_14gradients/clip_by_value_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0

&gradients/clip_by_value_grad/Reshape_1Reshape"gradients/clip_by_value_grad/Sum_1$gradients/clip_by_value_grad/Shape_1*
T0*
Tshape0

-gradients/clip_by_value_grad/tuple/group_depsNoOp%^gradients/clip_by_value_grad/Reshape'^gradients/clip_by_value_grad/Reshape_1
Ł
5gradients/clip_by_value_grad/tuple/control_dependencyIdentity$gradients/clip_by_value_grad/Reshape.^gradients/clip_by_value_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients/clip_by_value_grad/Reshape
ß
7gradients/clip_by_value_grad/tuple/control_dependency_1Identity&gradients/clip_by_value_grad/Reshape_1.^gradients/clip_by_value_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients/clip_by_value_grad/Reshape_1
_
$gradients/clip_by_value_1_grad/ShapeShapeclip_by_value_1/Minimum*
T0*
out_type0
O
&gradients/clip_by_value_1_grad/Shape_1Const*
valueB *
dtype0
z
&gradients/clip_by_value_1_grad/Shape_2Shape0gradients/add_13_grad/tuple/control_dependency_1*
T0*
out_type0
W
*gradients/clip_by_value_1_grad/zeros/ConstConst*
valueB
 *    *
dtype0

$gradients/clip_by_value_1_grad/zerosFill&gradients/clip_by_value_1_grad/Shape_2*gradients/clip_by_value_1_grad/zeros/Const*
T0*

index_type0
d
+gradients/clip_by_value_1_grad/GreaterEqualGreaterEqualclip_by_value_1/MinimumNeg_3*
T0
¤
4gradients/clip_by_value_1_grad/BroadcastGradientArgsBroadcastGradientArgs$gradients/clip_by_value_1_grad/Shape&gradients/clip_by_value_1_grad/Shape_1*
T0
½
%gradients/clip_by_value_1_grad/SelectSelect+gradients/clip_by_value_1_grad/GreaterEqual0gradients/add_13_grad/tuple/control_dependency_1$gradients/clip_by_value_1_grad/zeros*
T0
¬
"gradients/clip_by_value_1_grad/SumSum%gradients/clip_by_value_1_grad/Select4gradients/clip_by_value_1_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0

&gradients/clip_by_value_1_grad/ReshapeReshape"gradients/clip_by_value_1_grad/Sum$gradients/clip_by_value_1_grad/Shape*
T0*
Tshape0
æ
'gradients/clip_by_value_1_grad/Select_1Select+gradients/clip_by_value_1_grad/GreaterEqual$gradients/clip_by_value_1_grad/zeros0gradients/add_13_grad/tuple/control_dependency_1*
T0
²
$gradients/clip_by_value_1_grad/Sum_1Sum'gradients/clip_by_value_1_grad/Select_16gradients/clip_by_value_1_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0

(gradients/clip_by_value_1_grad/Reshape_1Reshape$gradients/clip_by_value_1_grad/Sum_1&gradients/clip_by_value_1_grad/Shape_1*
T0*
Tshape0

/gradients/clip_by_value_1_grad/tuple/group_depsNoOp'^gradients/clip_by_value_1_grad/Reshape)^gradients/clip_by_value_1_grad/Reshape_1
į
7gradients/clip_by_value_1_grad/tuple/control_dependencyIdentity&gradients/clip_by_value_1_grad/Reshape0^gradients/clip_by_value_1_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients/clip_by_value_1_grad/Reshape
ē
9gradients/clip_by_value_1_grad/tuple/control_dependency_1Identity(gradients/clip_by_value_1_grad/Reshape_10^gradients/clip_by_value_1_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients/clip_by_value_1_grad/Reshape_1
a
$gradients/strided_slice_5_grad/ShapeShapeaction_probs/action_probs*
T0*
out_type0
Ģ
/gradients/strided_slice_5_grad/StridedSliceGradStridedSliceGrad$gradients/strided_slice_5_grad/Shapestrided_slice_5/stackstrided_slice_5/stack_1strided_slice_5/stack_2gradients/Softmax_2_grad/mul_1*
Index0*
T0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
E
gradients/Sum_3_grad/ShapeShapestack_1*
T0*
out_type0
r
gradients/Sum_3_grad/SizeConst*-
_class#
!loc:@gradients/Sum_3_grad/Shape*
value	B :*
dtype0

gradients/Sum_3_grad/addAddV2Sum_3/reduction_indicesgradients/Sum_3_grad/Size*
T0*-
_class#
!loc:@gradients/Sum_3_grad/Shape

gradients/Sum_3_grad/modFloorModgradients/Sum_3_grad/addgradients/Sum_3_grad/Size*
T0*-
_class#
!loc:@gradients/Sum_3_grad/Shape
t
gradients/Sum_3_grad/Shape_1Const*-
_class#
!loc:@gradients/Sum_3_grad/Shape*
valueB *
dtype0
y
 gradients/Sum_3_grad/range/startConst*-
_class#
!loc:@gradients/Sum_3_grad/Shape*
value	B : *
dtype0
y
 gradients/Sum_3_grad/range/deltaConst*-
_class#
!loc:@gradients/Sum_3_grad/Shape*
value	B :*
dtype0
½
gradients/Sum_3_grad/rangeRange gradients/Sum_3_grad/range/startgradients/Sum_3_grad/Size gradients/Sum_3_grad/range/delta*

Tidx0*-
_class#
!loc:@gradients/Sum_3_grad/Shape
x
gradients/Sum_3_grad/Fill/valueConst*-
_class#
!loc:@gradients/Sum_3_grad/Shape*
value	B :*
dtype0
Ŗ
gradients/Sum_3_grad/FillFillgradients/Sum_3_grad/Shape_1gradients/Sum_3_grad/Fill/value*
T0*-
_class#
!loc:@gradients/Sum_3_grad/Shape*

index_type0
į
"gradients/Sum_3_grad/DynamicStitchDynamicStitchgradients/Sum_3_grad/rangegradients/Sum_3_grad/modgradients/Sum_3_grad/Shapegradients/Sum_3_grad/Fill*
T0*-
_class#
!loc:@gradients/Sum_3_grad/Shape*
N
w
gradients/Sum_3_grad/Maximum/yConst*-
_class#
!loc:@gradients/Sum_3_grad/Shape*
value	B :*
dtype0
£
gradients/Sum_3_grad/MaximumMaximum"gradients/Sum_3_grad/DynamicStitchgradients/Sum_3_grad/Maximum/y*
T0*-
_class#
!loc:@gradients/Sum_3_grad/Shape

gradients/Sum_3_grad/floordivFloorDivgradients/Sum_3_grad/Shapegradients/Sum_3_grad/Maximum*
T0*-
_class#
!loc:@gradients/Sum_3_grad/Shape

gradients/Sum_3_grad/ReshapeReshape-gradients/sub_6_grad/tuple/control_dependency"gradients/Sum_3_grad/DynamicStitch*
T0*
Tshape0
y
gradients/Sum_3_grad/TileTilegradients/Sum_3_grad/Reshapegradients/Sum_3_grad/floordiv*

Tmultiples0*
T0
S
*gradients/clip_by_value/Minimum_grad/ShapeShapesub_4*
T0*
out_type0
U
,gradients/clip_by_value/Minimum_grad/Shape_1Const*
valueB *
dtype0

,gradients/clip_by_value/Minimum_grad/Shape_2Shape5gradients/clip_by_value_grad/tuple/control_dependency*
T0*
out_type0
]
0gradients/clip_by_value/Minimum_grad/zeros/ConstConst*
valueB
 *    *
dtype0
­
*gradients/clip_by_value/Minimum_grad/zerosFill,gradients/clip_by_value/Minimum_grad/Shape_20gradients/clip_by_value/Minimum_grad/zeros/Const*
T0*

index_type0
^
.gradients/clip_by_value/Minimum_grad/LessEqual	LessEqualsub_4PolynomialDecay_1*
T0
¶
:gradients/clip_by_value/Minimum_grad/BroadcastGradientArgsBroadcastGradientArgs*gradients/clip_by_value/Minimum_grad/Shape,gradients/clip_by_value/Minimum_grad/Shape_1*
T0
Ń
+gradients/clip_by_value/Minimum_grad/SelectSelect.gradients/clip_by_value/Minimum_grad/LessEqual5gradients/clip_by_value_grad/tuple/control_dependency*gradients/clip_by_value/Minimum_grad/zeros*
T0
¾
(gradients/clip_by_value/Minimum_grad/SumSum+gradients/clip_by_value/Minimum_grad/Select:gradients/clip_by_value/Minimum_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
¤
,gradients/clip_by_value/Minimum_grad/ReshapeReshape(gradients/clip_by_value/Minimum_grad/Sum*gradients/clip_by_value/Minimum_grad/Shape*
T0*
Tshape0
Ó
-gradients/clip_by_value/Minimum_grad/Select_1Select.gradients/clip_by_value/Minimum_grad/LessEqual*gradients/clip_by_value/Minimum_grad/zeros5gradients/clip_by_value_grad/tuple/control_dependency*
T0
Ä
*gradients/clip_by_value/Minimum_grad/Sum_1Sum-gradients/clip_by_value/Minimum_grad/Select_1<gradients/clip_by_value/Minimum_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
Ŗ
.gradients/clip_by_value/Minimum_grad/Reshape_1Reshape*gradients/clip_by_value/Minimum_grad/Sum_1,gradients/clip_by_value/Minimum_grad/Shape_1*
T0*
Tshape0

5gradients/clip_by_value/Minimum_grad/tuple/group_depsNoOp-^gradients/clip_by_value/Minimum_grad/Reshape/^gradients/clip_by_value/Minimum_grad/Reshape_1
ł
=gradients/clip_by_value/Minimum_grad/tuple/control_dependencyIdentity,gradients/clip_by_value/Minimum_grad/Reshape6^gradients/clip_by_value/Minimum_grad/tuple/group_deps*
T0*?
_class5
31loc:@gradients/clip_by_value/Minimum_grad/Reshape
’
?gradients/clip_by_value/Minimum_grad/tuple/control_dependency_1Identity.gradients/clip_by_value/Minimum_grad/Reshape_16^gradients/clip_by_value/Minimum_grad/tuple/group_deps*
T0*A
_class7
53loc:@gradients/clip_by_value/Minimum_grad/Reshape_1
U
,gradients/clip_by_value_1/Minimum_grad/ShapeShapesub_5*
T0*
out_type0
W
.gradients/clip_by_value_1/Minimum_grad/Shape_1Const*
valueB *
dtype0

.gradients/clip_by_value_1/Minimum_grad/Shape_2Shape7gradients/clip_by_value_1_grad/tuple/control_dependency*
T0*
out_type0
_
2gradients/clip_by_value_1/Minimum_grad/zeros/ConstConst*
valueB
 *    *
dtype0
³
,gradients/clip_by_value_1/Minimum_grad/zerosFill.gradients/clip_by_value_1/Minimum_grad/Shape_22gradients/clip_by_value_1/Minimum_grad/zeros/Const*
T0*

index_type0
`
0gradients/clip_by_value_1/Minimum_grad/LessEqual	LessEqualsub_5PolynomialDecay_1*
T0
¼
<gradients/clip_by_value_1/Minimum_grad/BroadcastGradientArgsBroadcastGradientArgs,gradients/clip_by_value_1/Minimum_grad/Shape.gradients/clip_by_value_1/Minimum_grad/Shape_1*
T0
Ł
-gradients/clip_by_value_1/Minimum_grad/SelectSelect0gradients/clip_by_value_1/Minimum_grad/LessEqual7gradients/clip_by_value_1_grad/tuple/control_dependency,gradients/clip_by_value_1/Minimum_grad/zeros*
T0
Ä
*gradients/clip_by_value_1/Minimum_grad/SumSum-gradients/clip_by_value_1/Minimum_grad/Select<gradients/clip_by_value_1/Minimum_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
Ŗ
.gradients/clip_by_value_1/Minimum_grad/ReshapeReshape*gradients/clip_by_value_1/Minimum_grad/Sum,gradients/clip_by_value_1/Minimum_grad/Shape*
T0*
Tshape0
Ū
/gradients/clip_by_value_1/Minimum_grad/Select_1Select0gradients/clip_by_value_1/Minimum_grad/LessEqual,gradients/clip_by_value_1/Minimum_grad/zeros7gradients/clip_by_value_1_grad/tuple/control_dependency*
T0
Ź
,gradients/clip_by_value_1/Minimum_grad/Sum_1Sum/gradients/clip_by_value_1/Minimum_grad/Select_1>gradients/clip_by_value_1/Minimum_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
°
0gradients/clip_by_value_1/Minimum_grad/Reshape_1Reshape,gradients/clip_by_value_1/Minimum_grad/Sum_1.gradients/clip_by_value_1/Minimum_grad/Shape_1*
T0*
Tshape0
£
7gradients/clip_by_value_1/Minimum_grad/tuple/group_depsNoOp/^gradients/clip_by_value_1/Minimum_grad/Reshape1^gradients/clip_by_value_1/Minimum_grad/Reshape_1

?gradients/clip_by_value_1/Minimum_grad/tuple/control_dependencyIdentity.gradients/clip_by_value_1/Minimum_grad/Reshape8^gradients/clip_by_value_1/Minimum_grad/tuple/group_deps*
T0*A
_class7
53loc:@gradients/clip_by_value_1/Minimum_grad/Reshape

Agradients/clip_by_value_1/Minimum_grad/tuple/control_dependency_1Identity0gradients/clip_by_value_1/Minimum_grad/Reshape_18^gradients/clip_by_value_1/Minimum_grad/tuple/group_deps*
T0*C
_class9
75loc:@gradients/clip_by_value_1/Minimum_grad/Reshape_1
c
gradients/stack_1_grad/unstackUnpackgradients/Sum_3_grad/Tile*
T0*	
num*

axis
C
gradients/sub_4_grad/ShapeShapeSum_5*
T0*
out_type0
X
gradients/sub_4_grad/Shape_1Shapeextrinsic_value_estimate*
T0*
out_type0

*gradients/sub_4_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/sub_4_grad/Shapegradients/sub_4_grad/Shape_1*
T0
°
gradients/sub_4_grad/SumSum=gradients/clip_by_value/Minimum_grad/tuple/control_dependency*gradients/sub_4_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
t
gradients/sub_4_grad/ReshapeReshapegradients/sub_4_grad/Sumgradients/sub_4_grad/Shape*
T0*
Tshape0
g
gradients/sub_4_grad/NegNeg=gradients/clip_by_value/Minimum_grad/tuple/control_dependency*
T0

gradients/sub_4_grad/Sum_1Sumgradients/sub_4_grad/Neg,gradients/sub_4_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
z
gradients/sub_4_grad/Reshape_1Reshapegradients/sub_4_grad/Sum_1gradients/sub_4_grad/Shape_1*
T0*
Tshape0
m
%gradients/sub_4_grad/tuple/group_depsNoOp^gradients/sub_4_grad/Reshape^gradients/sub_4_grad/Reshape_1
¹
-gradients/sub_4_grad/tuple/control_dependencyIdentitygradients/sub_4_grad/Reshape&^gradients/sub_4_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/sub_4_grad/Reshape
æ
/gradients/sub_4_grad/tuple/control_dependency_1Identitygradients/sub_4_grad/Reshape_1&^gradients/sub_4_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/sub_4_grad/Reshape_1
C
gradients/sub_5_grad/ShapeShapeSum_7*
T0*
out_type0
X
gradients/sub_5_grad/Shape_1Shapecuriosity_value_estimate*
T0*
out_type0

*gradients/sub_5_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/sub_5_grad/Shapegradients/sub_5_grad/Shape_1*
T0
²
gradients/sub_5_grad/SumSum?gradients/clip_by_value_1/Minimum_grad/tuple/control_dependency*gradients/sub_5_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
t
gradients/sub_5_grad/ReshapeReshapegradients/sub_5_grad/Sumgradients/sub_5_grad/Shape*
T0*
Tshape0
i
gradients/sub_5_grad/NegNeg?gradients/clip_by_value_1/Minimum_grad/tuple/control_dependency*
T0

gradients/sub_5_grad/Sum_1Sumgradients/sub_5_grad/Neg,gradients/sub_5_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
z
gradients/sub_5_grad/Reshape_1Reshapegradients/sub_5_grad/Sum_1gradients/sub_5_grad/Shape_1*
T0*
Tshape0
m
%gradients/sub_5_grad/tuple/group_depsNoOp^gradients/sub_5_grad/Reshape^gradients/sub_5_grad/Reshape_1
¹
-gradients/sub_5_grad/tuple/control_dependencyIdentitygradients/sub_5_grad/Reshape&^gradients/sub_5_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/sub_5_grad/Reshape
æ
/gradients/sub_5_grad/tuple/control_dependency_1Identitygradients/sub_5_grad/Reshape_1&^gradients/sub_5_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/sub_5_grad/Reshape_1
F
gradients/Neg_grad/NegNeggradients/stack_1_grad/unstack*
T0
U
gradients/Sum_5_grad/ShapeShapeextrinsic_value/BiasAdd*
T0*
out_type0
r
gradients/Sum_5_grad/SizeConst*-
_class#
!loc:@gradients/Sum_5_grad/Shape*
value	B :*
dtype0

gradients/Sum_5_grad/addAddV2Sum_5/reduction_indicesgradients/Sum_5_grad/Size*
T0*-
_class#
!loc:@gradients/Sum_5_grad/Shape

gradients/Sum_5_grad/modFloorModgradients/Sum_5_grad/addgradients/Sum_5_grad/Size*
T0*-
_class#
!loc:@gradients/Sum_5_grad/Shape
t
gradients/Sum_5_grad/Shape_1Const*-
_class#
!loc:@gradients/Sum_5_grad/Shape*
valueB *
dtype0
y
 gradients/Sum_5_grad/range/startConst*-
_class#
!loc:@gradients/Sum_5_grad/Shape*
value	B : *
dtype0
y
 gradients/Sum_5_grad/range/deltaConst*-
_class#
!loc:@gradients/Sum_5_grad/Shape*
value	B :*
dtype0
½
gradients/Sum_5_grad/rangeRange gradients/Sum_5_grad/range/startgradients/Sum_5_grad/Size gradients/Sum_5_grad/range/delta*

Tidx0*-
_class#
!loc:@gradients/Sum_5_grad/Shape
x
gradients/Sum_5_grad/Fill/valueConst*-
_class#
!loc:@gradients/Sum_5_grad/Shape*
value	B :*
dtype0
Ŗ
gradients/Sum_5_grad/FillFillgradients/Sum_5_grad/Shape_1gradients/Sum_5_grad/Fill/value*
T0*-
_class#
!loc:@gradients/Sum_5_grad/Shape*

index_type0
į
"gradients/Sum_5_grad/DynamicStitchDynamicStitchgradients/Sum_5_grad/rangegradients/Sum_5_grad/modgradients/Sum_5_grad/Shapegradients/Sum_5_grad/Fill*
T0*-
_class#
!loc:@gradients/Sum_5_grad/Shape*
N
w
gradients/Sum_5_grad/Maximum/yConst*-
_class#
!loc:@gradients/Sum_5_grad/Shape*
value	B :*
dtype0
£
gradients/Sum_5_grad/MaximumMaximum"gradients/Sum_5_grad/DynamicStitchgradients/Sum_5_grad/Maximum/y*
T0*-
_class#
!loc:@gradients/Sum_5_grad/Shape

gradients/Sum_5_grad/floordivFloorDivgradients/Sum_5_grad/Shapegradients/Sum_5_grad/Maximum*
T0*-
_class#
!loc:@gradients/Sum_5_grad/Shape

gradients/Sum_5_grad/ReshapeReshape-gradients/sub_4_grad/tuple/control_dependency"gradients/Sum_5_grad/DynamicStitch*
T0*
Tshape0
y
gradients/Sum_5_grad/TileTilegradients/Sum_5_grad/Reshapegradients/Sum_5_grad/floordiv*

Tmultiples0*
T0
U
gradients/Sum_7_grad/ShapeShapecuriosity_value/BiasAdd*
T0*
out_type0
r
gradients/Sum_7_grad/SizeConst*-
_class#
!loc:@gradients/Sum_7_grad/Shape*
value	B :*
dtype0

gradients/Sum_7_grad/addAddV2Sum_7/reduction_indicesgradients/Sum_7_grad/Size*
T0*-
_class#
!loc:@gradients/Sum_7_grad/Shape

gradients/Sum_7_grad/modFloorModgradients/Sum_7_grad/addgradients/Sum_7_grad/Size*
T0*-
_class#
!loc:@gradients/Sum_7_grad/Shape
t
gradients/Sum_7_grad/Shape_1Const*-
_class#
!loc:@gradients/Sum_7_grad/Shape*
valueB *
dtype0
y
 gradients/Sum_7_grad/range/startConst*-
_class#
!loc:@gradients/Sum_7_grad/Shape*
value	B : *
dtype0
y
 gradients/Sum_7_grad/range/deltaConst*-
_class#
!loc:@gradients/Sum_7_grad/Shape*
value	B :*
dtype0
½
gradients/Sum_7_grad/rangeRange gradients/Sum_7_grad/range/startgradients/Sum_7_grad/Size gradients/Sum_7_grad/range/delta*

Tidx0*-
_class#
!loc:@gradients/Sum_7_grad/Shape
x
gradients/Sum_7_grad/Fill/valueConst*-
_class#
!loc:@gradients/Sum_7_grad/Shape*
value	B :*
dtype0
Ŗ
gradients/Sum_7_grad/FillFillgradients/Sum_7_grad/Shape_1gradients/Sum_7_grad/Fill/value*
T0*-
_class#
!loc:@gradients/Sum_7_grad/Shape*

index_type0
į
"gradients/Sum_7_grad/DynamicStitchDynamicStitchgradients/Sum_7_grad/rangegradients/Sum_7_grad/modgradients/Sum_7_grad/Shapegradients/Sum_7_grad/Fill*
T0*-
_class#
!loc:@gradients/Sum_7_grad/Shape*
N
w
gradients/Sum_7_grad/Maximum/yConst*-
_class#
!loc:@gradients/Sum_7_grad/Shape*
value	B :*
dtype0
£
gradients/Sum_7_grad/MaximumMaximum"gradients/Sum_7_grad/DynamicStitchgradients/Sum_7_grad/Maximum/y*
T0*-
_class#
!loc:@gradients/Sum_7_grad/Shape

gradients/Sum_7_grad/floordivFloorDivgradients/Sum_7_grad/Shapegradients/Sum_7_grad/Maximum*
T0*-
_class#
!loc:@gradients/Sum_7_grad/Shape

gradients/Sum_7_grad/ReshapeReshape-gradients/sub_5_grad/tuple/control_dependency"gradients/Sum_7_grad/DynamicStitch*
T0*
Tshape0
y
gradients/Sum_7_grad/TileTilegradients/Sum_7_grad/Reshapegradients/Sum_7_grad/floordiv*

Tmultiples0*
T0

Bgradients/softmax_cross_entropy_with_logits_1/Reshape_2_grad/ShapeShape#softmax_cross_entropy_with_logits_1*
T0*
out_type0
Ā
Dgradients/softmax_cross_entropy_with_logits_1/Reshape_2_grad/ReshapeReshapegradients/Neg_grad/NegBgradients/softmax_cross_entropy_with_logits_1/Reshape_2_grad/Shape*
T0*
Tshape0

gradients/AddN_1AddNgradients/Sum_6_grad/Tilegradients/Sum_5_grad/Tile*
T0*,
_class"
 loc:@gradients/Sum_6_grad/Tile*
N
s
2gradients/extrinsic_value/BiasAdd_grad/BiasAddGradBiasAddGradgradients/AddN_1*
T0*
data_formatNHWC

7gradients/extrinsic_value/BiasAdd_grad/tuple/group_depsNoOp^gradients/AddN_13^gradients/extrinsic_value/BiasAdd_grad/BiasAddGrad
Ī
?gradients/extrinsic_value/BiasAdd_grad/tuple/control_dependencyIdentitygradients/AddN_18^gradients/extrinsic_value/BiasAdd_grad/tuple/group_deps*
T0*,
_class"
 loc:@gradients/Sum_6_grad/Tile

Agradients/extrinsic_value/BiasAdd_grad/tuple/control_dependency_1Identity2gradients/extrinsic_value/BiasAdd_grad/BiasAddGrad8^gradients/extrinsic_value/BiasAdd_grad/tuple/group_deps*
T0*E
_class;
97loc:@gradients/extrinsic_value/BiasAdd_grad/BiasAddGrad

gradients/AddN_2AddNgradients/Sum_8_grad/Tilegradients/Sum_7_grad/Tile*
T0*,
_class"
 loc:@gradients/Sum_8_grad/Tile*
N
s
2gradients/curiosity_value/BiasAdd_grad/BiasAddGradBiasAddGradgradients/AddN_2*
T0*
data_formatNHWC

7gradients/curiosity_value/BiasAdd_grad/tuple/group_depsNoOp^gradients/AddN_23^gradients/curiosity_value/BiasAdd_grad/BiasAddGrad
Ī
?gradients/curiosity_value/BiasAdd_grad/tuple/control_dependencyIdentitygradients/AddN_28^gradients/curiosity_value/BiasAdd_grad/tuple/group_deps*
T0*,
_class"
 loc:@gradients/Sum_8_grad/Tile

Agradients/curiosity_value/BiasAdd_grad/tuple/control_dependency_1Identity2gradients/curiosity_value/BiasAdd_grad/BiasAddGrad8^gradients/curiosity_value/BiasAdd_grad/tuple/group_deps*
T0*E
_class;
97loc:@gradients/curiosity_value/BiasAdd_grad/BiasAddGrad
S
gradients/zeros_like_5	ZerosLike%softmax_cross_entropy_with_logits_1:1*
T0
t
Agradients/softmax_cross_entropy_with_logits_1_grad/ExpandDims/dimConst*
valueB :
’’’’’’’’’*
dtype0
é
=gradients/softmax_cross_entropy_with_logits_1_grad/ExpandDims
ExpandDimsDgradients/softmax_cross_entropy_with_logits_1/Reshape_2_grad/ReshapeAgradients/softmax_cross_entropy_with_logits_1_grad/ExpandDims/dim*

Tdim0*
T0
¬
6gradients/softmax_cross_entropy_with_logits_1_grad/mulMul=gradients/softmax_cross_entropy_with_logits_1_grad/ExpandDims%softmax_cross_entropy_with_logits_1:1*
T0

=gradients/softmax_cross_entropy_with_logits_1_grad/LogSoftmax
LogSoftmax+softmax_cross_entropy_with_logits_1/Reshape*
T0

6gradients/softmax_cross_entropy_with_logits_1_grad/NegNeg=gradients/softmax_cross_entropy_with_logits_1_grad/LogSoftmax*
T0
v
Cgradients/softmax_cross_entropy_with_logits_1_grad/ExpandDims_1/dimConst*
valueB :
’’’’’’’’’*
dtype0
ķ
?gradients/softmax_cross_entropy_with_logits_1_grad/ExpandDims_1
ExpandDimsDgradients/softmax_cross_entropy_with_logits_1/Reshape_2_grad/ReshapeCgradients/softmax_cross_entropy_with_logits_1_grad/ExpandDims_1/dim*

Tdim0*
T0
Į
8gradients/softmax_cross_entropy_with_logits_1_grad/mul_1Mul?gradients/softmax_cross_entropy_with_logits_1_grad/ExpandDims_16gradients/softmax_cross_entropy_with_logits_1_grad/Neg*
T0
æ
Cgradients/softmax_cross_entropy_with_logits_1_grad/tuple/group_depsNoOp7^gradients/softmax_cross_entropy_with_logits_1_grad/mul9^gradients/softmax_cross_entropy_with_logits_1_grad/mul_1
©
Kgradients/softmax_cross_entropy_with_logits_1_grad/tuple/control_dependencyIdentity6gradients/softmax_cross_entropy_with_logits_1_grad/mulD^gradients/softmax_cross_entropy_with_logits_1_grad/tuple/group_deps*
T0*I
_class?
=;loc:@gradients/softmax_cross_entropy_with_logits_1_grad/mul
Æ
Mgradients/softmax_cross_entropy_with_logits_1_grad/tuple/control_dependency_1Identity8gradients/softmax_cross_entropy_with_logits_1_grad/mul_1D^gradients/softmax_cross_entropy_with_logits_1_grad/tuple/group_deps*
T0*K
_classA
?=loc:@gradients/softmax_cross_entropy_with_logits_1_grad/mul_1
Ć
,gradients/extrinsic_value/MatMul_grad/MatMulMatMul?gradients/extrinsic_value/BiasAdd_grad/tuple/control_dependencyextrinsic_value/kernel/read*
transpose_b(*
T0*
transpose_a( 
Ć
.gradients/extrinsic_value/MatMul_grad/MatMul_1MatMulmain_graph_0/hidden_3/Mul?gradients/extrinsic_value/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(

6gradients/extrinsic_value/MatMul_grad/tuple/group_depsNoOp-^gradients/extrinsic_value/MatMul_grad/MatMul/^gradients/extrinsic_value/MatMul_grad/MatMul_1
ū
>gradients/extrinsic_value/MatMul_grad/tuple/control_dependencyIdentity,gradients/extrinsic_value/MatMul_grad/MatMul7^gradients/extrinsic_value/MatMul_grad/tuple/group_deps*
T0*?
_class5
31loc:@gradients/extrinsic_value/MatMul_grad/MatMul

@gradients/extrinsic_value/MatMul_grad/tuple/control_dependency_1Identity.gradients/extrinsic_value/MatMul_grad/MatMul_17^gradients/extrinsic_value/MatMul_grad/tuple/group_deps*
T0*A
_class7
53loc:@gradients/extrinsic_value/MatMul_grad/MatMul_1
Ć
,gradients/curiosity_value/MatMul_grad/MatMulMatMul?gradients/curiosity_value/BiasAdd_grad/tuple/control_dependencycuriosity_value/kernel/read*
transpose_b(*
T0*
transpose_a( 
Ć
.gradients/curiosity_value/MatMul_grad/MatMul_1MatMulmain_graph_0/hidden_3/Mul?gradients/curiosity_value/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(

6gradients/curiosity_value/MatMul_grad/tuple/group_depsNoOp-^gradients/curiosity_value/MatMul_grad/MatMul/^gradients/curiosity_value/MatMul_grad/MatMul_1
ū
>gradients/curiosity_value/MatMul_grad/tuple/control_dependencyIdentity,gradients/curiosity_value/MatMul_grad/MatMul7^gradients/curiosity_value/MatMul_grad/tuple/group_deps*
T0*?
_class5
31loc:@gradients/curiosity_value/MatMul_grad/MatMul

@gradients/curiosity_value/MatMul_grad/tuple/control_dependency_1Identity.gradients/curiosity_value/MatMul_grad/MatMul_17^gradients/curiosity_value/MatMul_grad/tuple/group_deps*
T0*A
_class7
53loc:@gradients/curiosity_value/MatMul_grad/MatMul_1
s
@gradients/softmax_cross_entropy_with_logits_1/Reshape_grad/ShapeShapestrided_slice_8*
T0*
out_type0
ó
Bgradients/softmax_cross_entropy_with_logits_1/Reshape_grad/ReshapeReshapeKgradients/softmax_cross_entropy_with_logits_1_grad/tuple/control_dependency@gradients/softmax_cross_entropy_with_logits_1/Reshape_grad/Shape*
T0*
Tshape0
W
$gradients/strided_slice_8_grad/ShapeShapeconcat_2/concat*
T0*
out_type0
š
/gradients/strided_slice_8_grad/StridedSliceGradStridedSliceGrad$gradients/strided_slice_8_grad/Shapestrided_slice_8/stackstrided_slice_8/stack_1strided_slice_8/stack_2Bgradients/softmax_cross_entropy_with_logits_1/Reshape_grad/Reshape*
Index0*
T0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
o
gradients/Log_1_grad/Reciprocal
Reciprocaladd_80^gradients/strided_slice_8_grad/StridedSliceGrad*
T0
z
gradients/Log_1_grad/mulMul/gradients/strided_slice_8_grad/StridedSliceGradgradients/Log_1_grad/Reciprocal*
T0
G
gradients/add_8_grad/ShapeShape	truediv_3*
T0*
out_type0
G
gradients/add_8_grad/Shape_1Shapeadd_8/y*
T0*
out_type0

*gradients/add_8_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/add_8_grad/Shapegradients/add_8_grad/Shape_1*
T0

gradients/add_8_grad/SumSumgradients/Log_1_grad/mul*gradients/add_8_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
t
gradients/add_8_grad/ReshapeReshapegradients/add_8_grad/Sumgradients/add_8_grad/Shape*
T0*
Tshape0

gradients/add_8_grad/Sum_1Sumgradients/Log_1_grad/mul,gradients/add_8_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
z
gradients/add_8_grad/Reshape_1Reshapegradients/add_8_grad/Sum_1gradients/add_8_grad/Shape_1*
T0*
Tshape0
m
%gradients/add_8_grad/tuple/group_depsNoOp^gradients/add_8_grad/Reshape^gradients/add_8_grad/Reshape_1
¹
-gradients/add_8_grad/tuple/control_dependencyIdentitygradients/add_8_grad/Reshape&^gradients/add_8_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/add_8_grad/Reshape
æ
/gradients/add_8_grad/tuple/control_dependency_1Identitygradients/add_8_grad/Reshape_1&^gradients/add_8_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/add_8_grad/Reshape_1
G
gradients/truediv_3_grad/ShapeShapeMul_1*
T0*
out_type0
G
 gradients/truediv_3_grad/Shape_1ShapeSum*
T0*
out_type0

.gradients/truediv_3_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/truediv_3_grad/Shape gradients/truediv_3_grad/Shape_1*
T0
h
 gradients/truediv_3_grad/RealDivRealDiv-gradients/add_8_grad/tuple/control_dependencySum*
T0

gradients/truediv_3_grad/SumSum gradients/truediv_3_grad/RealDiv.gradients/truediv_3_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0

 gradients/truediv_3_grad/ReshapeReshapegradients/truediv_3_grad/Sumgradients/truediv_3_grad/Shape*
T0*
Tshape0
3
gradients/truediv_3_grad/NegNegMul_1*
T0
Y
"gradients/truediv_3_grad/RealDiv_1RealDivgradients/truediv_3_grad/NegSum*
T0
_
"gradients/truediv_3_grad/RealDiv_2RealDiv"gradients/truediv_3_grad/RealDiv_1Sum*
T0

gradients/truediv_3_grad/mulMul-gradients/add_8_grad/tuple/control_dependency"gradients/truediv_3_grad/RealDiv_2*
T0

gradients/truediv_3_grad/Sum_1Sumgradients/truediv_3_grad/mul0gradients/truediv_3_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0

"gradients/truediv_3_grad/Reshape_1Reshapegradients/truediv_3_grad/Sum_1 gradients/truediv_3_grad/Shape_1*
T0*
Tshape0
y
)gradients/truediv_3_grad/tuple/group_depsNoOp!^gradients/truediv_3_grad/Reshape#^gradients/truediv_3_grad/Reshape_1
É
1gradients/truediv_3_grad/tuple/control_dependencyIdentity gradients/truediv_3_grad/Reshape*^gradients/truediv_3_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients/truediv_3_grad/Reshape
Ļ
3gradients/truediv_3_grad/tuple/control_dependency_1Identity"gradients/truediv_3_grad/Reshape_1*^gradients/truediv_3_grad/tuple/group_deps*
T0*5
_class+
)'loc:@gradients/truediv_3_grad/Reshape_1
A
gradients/Sum_grad/ShapeShapeMul_1*
T0*
out_type0
n
gradients/Sum_grad/SizeConst*+
_class!
loc:@gradients/Sum_grad/Shape*
value	B :*
dtype0

gradients/Sum_grad/addAddV2Sum/reduction_indicesgradients/Sum_grad/Size*
T0*+
_class!
loc:@gradients/Sum_grad/Shape

gradients/Sum_grad/modFloorModgradients/Sum_grad/addgradients/Sum_grad/Size*
T0*+
_class!
loc:@gradients/Sum_grad/Shape
p
gradients/Sum_grad/Shape_1Const*+
_class!
loc:@gradients/Sum_grad/Shape*
valueB *
dtype0
u
gradients/Sum_grad/range/startConst*+
_class!
loc:@gradients/Sum_grad/Shape*
value	B : *
dtype0
u
gradients/Sum_grad/range/deltaConst*+
_class!
loc:@gradients/Sum_grad/Shape*
value	B :*
dtype0
³
gradients/Sum_grad/rangeRangegradients/Sum_grad/range/startgradients/Sum_grad/Sizegradients/Sum_grad/range/delta*

Tidx0*+
_class!
loc:@gradients/Sum_grad/Shape
t
gradients/Sum_grad/Fill/valueConst*+
_class!
loc:@gradients/Sum_grad/Shape*
value	B :*
dtype0
¢
gradients/Sum_grad/FillFillgradients/Sum_grad/Shape_1gradients/Sum_grad/Fill/value*
T0*+
_class!
loc:@gradients/Sum_grad/Shape*

index_type0
Õ
 gradients/Sum_grad/DynamicStitchDynamicStitchgradients/Sum_grad/rangegradients/Sum_grad/modgradients/Sum_grad/Shapegradients/Sum_grad/Fill*
T0*+
_class!
loc:@gradients/Sum_grad/Shape*
N
s
gradients/Sum_grad/Maximum/yConst*+
_class!
loc:@gradients/Sum_grad/Shape*
value	B :*
dtype0

gradients/Sum_grad/MaximumMaximum gradients/Sum_grad/DynamicStitchgradients/Sum_grad/Maximum/y*
T0*+
_class!
loc:@gradients/Sum_grad/Shape

gradients/Sum_grad/floordivFloorDivgradients/Sum_grad/Shapegradients/Sum_grad/Maximum*
T0*+
_class!
loc:@gradients/Sum_grad/Shape

gradients/Sum_grad/ReshapeReshape3gradients/truediv_3_grad/tuple/control_dependency_1 gradients/Sum_grad/DynamicStitch*
T0*
Tshape0
s
gradients/Sum_grad/TileTilegradients/Sum_grad/Reshapegradients/Sum_grad/floordiv*

Tmultiples0*
T0
«
gradients/AddN_3AddN1gradients/truediv_3_grad/tuple/control_dependencygradients/Sum_grad/Tile*
T0*3
_class)
'%loc:@gradients/truediv_3_grad/Reshape*
N
C
gradients/Mul_1_grad/ShapeShapeadd_6*
T0*
out_type0
O
gradients/Mul_1_grad/Shape_1Shapestrided_slice_1*
T0*
out_type0

*gradients/Mul_1_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/Mul_1_grad/Shapegradients/Mul_1_grad/Shape_1*
T0
K
gradients/Mul_1_grad/MulMulgradients/AddN_3strided_slice_1*
T0

gradients/Mul_1_grad/SumSumgradients/Mul_1_grad/Mul*gradients/Mul_1_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
t
gradients/Mul_1_grad/ReshapeReshapegradients/Mul_1_grad/Sumgradients/Mul_1_grad/Shape*
T0*
Tshape0
C
gradients/Mul_1_grad/Mul_1Muladd_6gradients/AddN_3*
T0

gradients/Mul_1_grad/Sum_1Sumgradients/Mul_1_grad/Mul_1,gradients/Mul_1_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
z
gradients/Mul_1_grad/Reshape_1Reshapegradients/Mul_1_grad/Sum_1gradients/Mul_1_grad/Shape_1*
T0*
Tshape0
m
%gradients/Mul_1_grad/tuple/group_depsNoOp^gradients/Mul_1_grad/Reshape^gradients/Mul_1_grad/Reshape_1
¹
-gradients/Mul_1_grad/tuple/control_dependencyIdentitygradients/Mul_1_grad/Reshape&^gradients/Mul_1_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/Mul_1_grad/Reshape
æ
/gradients/Mul_1_grad/tuple/control_dependency_1Identitygradients/Mul_1_grad/Reshape_1&^gradients/Mul_1_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/Mul_1_grad/Reshape_1
E
gradients/add_6_grad/ShapeShapeSoftmax*
T0*
out_type0
G
gradients/add_6_grad/Shape_1Shapeadd_6/y*
T0*
out_type0

*gradients/add_6_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/add_6_grad/Shapegradients/add_6_grad/Shape_1*
T0
 
gradients/add_6_grad/SumSum-gradients/Mul_1_grad/tuple/control_dependency*gradients/add_6_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
t
gradients/add_6_grad/ReshapeReshapegradients/add_6_grad/Sumgradients/add_6_grad/Shape*
T0*
Tshape0
¤
gradients/add_6_grad/Sum_1Sum-gradients/Mul_1_grad/tuple/control_dependency,gradients/add_6_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
z
gradients/add_6_grad/Reshape_1Reshapegradients/add_6_grad/Sum_1gradients/add_6_grad/Shape_1*
T0*
Tshape0
m
%gradients/add_6_grad/tuple/group_depsNoOp^gradients/add_6_grad/Reshape^gradients/add_6_grad/Reshape_1
¹
-gradients/add_6_grad/tuple/control_dependencyIdentitygradients/add_6_grad/Reshape&^gradients/add_6_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/add_6_grad/Reshape
æ
/gradients/add_6_grad/tuple/control_dependency_1Identitygradients/add_6_grad/Reshape_1&^gradients/add_6_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/add_6_grad/Reshape_1
b
gradients/Softmax_grad/mulMul-gradients/add_6_grad/tuple/control_dependencySoftmax*
T0
_
,gradients/Softmax_grad/Sum/reduction_indicesConst*
valueB :
’’’’’’’’’*
dtype0

gradients/Softmax_grad/SumSumgradients/Softmax_grad/mul,gradients/Softmax_grad/Sum/reduction_indices*

Tidx0*
	keep_dims(*
T0
u
gradients/Softmax_grad/subSub-gradients/add_6_grad/tuple/control_dependencygradients/Softmax_grad/Sum*
T0
Q
gradients/Softmax_grad/mul_1Mulgradients/Softmax_grad/subSoftmax*
T0
_
"gradients/strided_slice_grad/ShapeShapeaction_probs/action_probs*
T0*
out_type0
Ą
-gradients/strided_slice_grad/StridedSliceGradStridedSliceGrad"gradients/strided_slice_grad/Shapestrided_slice/stackstrided_slice/stack_1strided_slice/stack_2gradients/Softmax_grad/mul_1*
Index0*
T0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
’
gradients/AddN_4AddN/gradients/strided_slice_6_grad/StridedSliceGrad/gradients/strided_slice_5_grad/StridedSliceGrad-gradients/strided_slice_grad/StridedSliceGrad*
T0*B
_class8
64loc:@gradients/strided_slice_6_grad/StridedSliceGrad*
N

"gradients/dense/MatMul_grad/MatMulMatMulgradients/AddN_4dense/kernel/read*
transpose_b(*
T0*
transpose_a( 

$gradients/dense/MatMul_grad/MatMul_1MatMulmain_graph_0/hidden_3/Mulgradients/AddN_4*
transpose_b( *
T0*
transpose_a(

,gradients/dense/MatMul_grad/tuple/group_depsNoOp#^gradients/dense/MatMul_grad/MatMul%^gradients/dense/MatMul_grad/MatMul_1
Ó
4gradients/dense/MatMul_grad/tuple/control_dependencyIdentity"gradients/dense/MatMul_grad/MatMul-^gradients/dense/MatMul_grad/tuple/group_deps*
T0*5
_class+
)'loc:@gradients/dense/MatMul_grad/MatMul
Ł
6gradients/dense/MatMul_grad/tuple/control_dependency_1Identity$gradients/dense/MatMul_grad/MatMul_1-^gradients/dense/MatMul_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients/dense/MatMul_grad/MatMul_1
”
gradients/AddN_5AddN>gradients/extrinsic_value/MatMul_grad/tuple/control_dependency>gradients/curiosity_value/MatMul_grad/tuple/control_dependency4gradients/dense/MatMul_grad/tuple/control_dependency*
T0*?
_class5
31loc:@gradients/extrinsic_value/MatMul_grad/MatMul*
N
o
.gradients/main_graph_0/hidden_3/Mul_grad/ShapeShapemain_graph_0/hidden_3/BiasAdd*
T0*
out_type0
q
0gradients/main_graph_0/hidden_3/Mul_grad/Shape_1Shapemain_graph_0/hidden_3/Sigmoid*
T0*
out_type0
Ā
>gradients/main_graph_0/hidden_3/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs.gradients/main_graph_0/hidden_3/Mul_grad/Shape0gradients/main_graph_0/hidden_3/Mul_grad/Shape_1*
T0
m
,gradients/main_graph_0/hidden_3/Mul_grad/MulMulgradients/AddN_5main_graph_0/hidden_3/Sigmoid*
T0
Ē
,gradients/main_graph_0/hidden_3/Mul_grad/SumSum,gradients/main_graph_0/hidden_3/Mul_grad/Mul>gradients/main_graph_0/hidden_3/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
°
0gradients/main_graph_0/hidden_3/Mul_grad/ReshapeReshape,gradients/main_graph_0/hidden_3/Mul_grad/Sum.gradients/main_graph_0/hidden_3/Mul_grad/Shape*
T0*
Tshape0
o
.gradients/main_graph_0/hidden_3/Mul_grad/Mul_1Mulmain_graph_0/hidden_3/BiasAddgradients/AddN_5*
T0
Ķ
.gradients/main_graph_0/hidden_3/Mul_grad/Sum_1Sum.gradients/main_graph_0/hidden_3/Mul_grad/Mul_1@gradients/main_graph_0/hidden_3/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
¶
2gradients/main_graph_0/hidden_3/Mul_grad/Reshape_1Reshape.gradients/main_graph_0/hidden_3/Mul_grad/Sum_10gradients/main_graph_0/hidden_3/Mul_grad/Shape_1*
T0*
Tshape0
©
9gradients/main_graph_0/hidden_3/Mul_grad/tuple/group_depsNoOp1^gradients/main_graph_0/hidden_3/Mul_grad/Reshape3^gradients/main_graph_0/hidden_3/Mul_grad/Reshape_1

Agradients/main_graph_0/hidden_3/Mul_grad/tuple/control_dependencyIdentity0gradients/main_graph_0/hidden_3/Mul_grad/Reshape:^gradients/main_graph_0/hidden_3/Mul_grad/tuple/group_deps*
T0*C
_class9
75loc:@gradients/main_graph_0/hidden_3/Mul_grad/Reshape

Cgradients/main_graph_0/hidden_3/Mul_grad/tuple/control_dependency_1Identity2gradients/main_graph_0/hidden_3/Mul_grad/Reshape_1:^gradients/main_graph_0/hidden_3/Mul_grad/tuple/group_deps*
T0*E
_class;
97loc:@gradients/main_graph_0/hidden_3/Mul_grad/Reshape_1
“
8gradients/main_graph_0/hidden_3/Sigmoid_grad/SigmoidGradSigmoidGradmain_graph_0/hidden_3/SigmoidCgradients/main_graph_0/hidden_3/Mul_grad/tuple/control_dependency_1*
T0
ģ
gradients/AddN_6AddNAgradients/main_graph_0/hidden_3/Mul_grad/tuple/control_dependency8gradients/main_graph_0/hidden_3/Sigmoid_grad/SigmoidGrad*
T0*C
_class9
75loc:@gradients/main_graph_0/hidden_3/Mul_grad/Reshape*
N
y
8gradients/main_graph_0/hidden_3/BiasAdd_grad/BiasAddGradBiasAddGradgradients/AddN_6*
T0*
data_formatNHWC

=gradients/main_graph_0/hidden_3/BiasAdd_grad/tuple/group_depsNoOp^gradients/AddN_69^gradients/main_graph_0/hidden_3/BiasAdd_grad/BiasAddGrad
ń
Egradients/main_graph_0/hidden_3/BiasAdd_grad/tuple/control_dependencyIdentitygradients/AddN_6>^gradients/main_graph_0/hidden_3/BiasAdd_grad/tuple/group_deps*
T0*C
_class9
75loc:@gradients/main_graph_0/hidden_3/Mul_grad/Reshape
£
Ggradients/main_graph_0/hidden_3/BiasAdd_grad/tuple/control_dependency_1Identity8gradients/main_graph_0/hidden_3/BiasAdd_grad/BiasAddGrad>^gradients/main_graph_0/hidden_3/BiasAdd_grad/tuple/group_deps*
T0*K
_classA
?=loc:@gradients/main_graph_0/hidden_3/BiasAdd_grad/BiasAddGrad
Õ
2gradients/main_graph_0/hidden_3/MatMul_grad/MatMulMatMulEgradients/main_graph_0/hidden_3/BiasAdd_grad/tuple/control_dependency!main_graph_0/hidden_3/kernel/read*
transpose_b(*
T0*
transpose_a( 
Ļ
4gradients/main_graph_0/hidden_3/MatMul_grad/MatMul_1MatMulmain_graph_0/hidden_2/MulEgradients/main_graph_0/hidden_3/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
°
<gradients/main_graph_0/hidden_3/MatMul_grad/tuple/group_depsNoOp3^gradients/main_graph_0/hidden_3/MatMul_grad/MatMul5^gradients/main_graph_0/hidden_3/MatMul_grad/MatMul_1

Dgradients/main_graph_0/hidden_3/MatMul_grad/tuple/control_dependencyIdentity2gradients/main_graph_0/hidden_3/MatMul_grad/MatMul=^gradients/main_graph_0/hidden_3/MatMul_grad/tuple/group_deps*
T0*E
_class;
97loc:@gradients/main_graph_0/hidden_3/MatMul_grad/MatMul

Fgradients/main_graph_0/hidden_3/MatMul_grad/tuple/control_dependency_1Identity4gradients/main_graph_0/hidden_3/MatMul_grad/MatMul_1=^gradients/main_graph_0/hidden_3/MatMul_grad/tuple/group_deps*
T0*G
_class=
;9loc:@gradients/main_graph_0/hidden_3/MatMul_grad/MatMul_1
o
.gradients/main_graph_0/hidden_2/Mul_grad/ShapeShapemain_graph_0/hidden_2/BiasAdd*
T0*
out_type0
q
0gradients/main_graph_0/hidden_2/Mul_grad/Shape_1Shapemain_graph_0/hidden_2/Sigmoid*
T0*
out_type0
Ā
>gradients/main_graph_0/hidden_2/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs.gradients/main_graph_0/hidden_2/Mul_grad/Shape0gradients/main_graph_0/hidden_2/Mul_grad/Shape_1*
T0
”
,gradients/main_graph_0/hidden_2/Mul_grad/MulMulDgradients/main_graph_0/hidden_3/MatMul_grad/tuple/control_dependencymain_graph_0/hidden_2/Sigmoid*
T0
Ē
,gradients/main_graph_0/hidden_2/Mul_grad/SumSum,gradients/main_graph_0/hidden_2/Mul_grad/Mul>gradients/main_graph_0/hidden_2/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
°
0gradients/main_graph_0/hidden_2/Mul_grad/ReshapeReshape,gradients/main_graph_0/hidden_2/Mul_grad/Sum.gradients/main_graph_0/hidden_2/Mul_grad/Shape*
T0*
Tshape0
£
.gradients/main_graph_0/hidden_2/Mul_grad/Mul_1Mulmain_graph_0/hidden_2/BiasAddDgradients/main_graph_0/hidden_3/MatMul_grad/tuple/control_dependency*
T0
Ķ
.gradients/main_graph_0/hidden_2/Mul_grad/Sum_1Sum.gradients/main_graph_0/hidden_2/Mul_grad/Mul_1@gradients/main_graph_0/hidden_2/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
¶
2gradients/main_graph_0/hidden_2/Mul_grad/Reshape_1Reshape.gradients/main_graph_0/hidden_2/Mul_grad/Sum_10gradients/main_graph_0/hidden_2/Mul_grad/Shape_1*
T0*
Tshape0
©
9gradients/main_graph_0/hidden_2/Mul_grad/tuple/group_depsNoOp1^gradients/main_graph_0/hidden_2/Mul_grad/Reshape3^gradients/main_graph_0/hidden_2/Mul_grad/Reshape_1

Agradients/main_graph_0/hidden_2/Mul_grad/tuple/control_dependencyIdentity0gradients/main_graph_0/hidden_2/Mul_grad/Reshape:^gradients/main_graph_0/hidden_2/Mul_grad/tuple/group_deps*
T0*C
_class9
75loc:@gradients/main_graph_0/hidden_2/Mul_grad/Reshape

Cgradients/main_graph_0/hidden_2/Mul_grad/tuple/control_dependency_1Identity2gradients/main_graph_0/hidden_2/Mul_grad/Reshape_1:^gradients/main_graph_0/hidden_2/Mul_grad/tuple/group_deps*
T0*E
_class;
97loc:@gradients/main_graph_0/hidden_2/Mul_grad/Reshape_1
“
8gradients/main_graph_0/hidden_2/Sigmoid_grad/SigmoidGradSigmoidGradmain_graph_0/hidden_2/SigmoidCgradients/main_graph_0/hidden_2/Mul_grad/tuple/control_dependency_1*
T0
ģ
gradients/AddN_7AddNAgradients/main_graph_0/hidden_2/Mul_grad/tuple/control_dependency8gradients/main_graph_0/hidden_2/Sigmoid_grad/SigmoidGrad*
T0*C
_class9
75loc:@gradients/main_graph_0/hidden_2/Mul_grad/Reshape*
N
y
8gradients/main_graph_0/hidden_2/BiasAdd_grad/BiasAddGradBiasAddGradgradients/AddN_7*
T0*
data_formatNHWC

=gradients/main_graph_0/hidden_2/BiasAdd_grad/tuple/group_depsNoOp^gradients/AddN_79^gradients/main_graph_0/hidden_2/BiasAdd_grad/BiasAddGrad
ń
Egradients/main_graph_0/hidden_2/BiasAdd_grad/tuple/control_dependencyIdentitygradients/AddN_7>^gradients/main_graph_0/hidden_2/BiasAdd_grad/tuple/group_deps*
T0*C
_class9
75loc:@gradients/main_graph_0/hidden_2/Mul_grad/Reshape
£
Ggradients/main_graph_0/hidden_2/BiasAdd_grad/tuple/control_dependency_1Identity8gradients/main_graph_0/hidden_2/BiasAdd_grad/BiasAddGrad>^gradients/main_graph_0/hidden_2/BiasAdd_grad/tuple/group_deps*
T0*K
_classA
?=loc:@gradients/main_graph_0/hidden_2/BiasAdd_grad/BiasAddGrad
Õ
2gradients/main_graph_0/hidden_2/MatMul_grad/MatMulMatMulEgradients/main_graph_0/hidden_2/BiasAdd_grad/tuple/control_dependency!main_graph_0/hidden_2/kernel/read*
transpose_b(*
T0*
transpose_a( 
Ļ
4gradients/main_graph_0/hidden_2/MatMul_grad/MatMul_1MatMulmain_graph_0/hidden_1/MulEgradients/main_graph_0/hidden_2/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
°
<gradients/main_graph_0/hidden_2/MatMul_grad/tuple/group_depsNoOp3^gradients/main_graph_0/hidden_2/MatMul_grad/MatMul5^gradients/main_graph_0/hidden_2/MatMul_grad/MatMul_1

Dgradients/main_graph_0/hidden_2/MatMul_grad/tuple/control_dependencyIdentity2gradients/main_graph_0/hidden_2/MatMul_grad/MatMul=^gradients/main_graph_0/hidden_2/MatMul_grad/tuple/group_deps*
T0*E
_class;
97loc:@gradients/main_graph_0/hidden_2/MatMul_grad/MatMul

Fgradients/main_graph_0/hidden_2/MatMul_grad/tuple/control_dependency_1Identity4gradients/main_graph_0/hidden_2/MatMul_grad/MatMul_1=^gradients/main_graph_0/hidden_2/MatMul_grad/tuple/group_deps*
T0*G
_class=
;9loc:@gradients/main_graph_0/hidden_2/MatMul_grad/MatMul_1
o
.gradients/main_graph_0/hidden_1/Mul_grad/ShapeShapemain_graph_0/hidden_1/BiasAdd*
T0*
out_type0
q
0gradients/main_graph_0/hidden_1/Mul_grad/Shape_1Shapemain_graph_0/hidden_1/Sigmoid*
T0*
out_type0
Ā
>gradients/main_graph_0/hidden_1/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs.gradients/main_graph_0/hidden_1/Mul_grad/Shape0gradients/main_graph_0/hidden_1/Mul_grad/Shape_1*
T0
”
,gradients/main_graph_0/hidden_1/Mul_grad/MulMulDgradients/main_graph_0/hidden_2/MatMul_grad/tuple/control_dependencymain_graph_0/hidden_1/Sigmoid*
T0
Ē
,gradients/main_graph_0/hidden_1/Mul_grad/SumSum,gradients/main_graph_0/hidden_1/Mul_grad/Mul>gradients/main_graph_0/hidden_1/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
°
0gradients/main_graph_0/hidden_1/Mul_grad/ReshapeReshape,gradients/main_graph_0/hidden_1/Mul_grad/Sum.gradients/main_graph_0/hidden_1/Mul_grad/Shape*
T0*
Tshape0
£
.gradients/main_graph_0/hidden_1/Mul_grad/Mul_1Mulmain_graph_0/hidden_1/BiasAddDgradients/main_graph_0/hidden_2/MatMul_grad/tuple/control_dependency*
T0
Ķ
.gradients/main_graph_0/hidden_1/Mul_grad/Sum_1Sum.gradients/main_graph_0/hidden_1/Mul_grad/Mul_1@gradients/main_graph_0/hidden_1/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
¶
2gradients/main_graph_0/hidden_1/Mul_grad/Reshape_1Reshape.gradients/main_graph_0/hidden_1/Mul_grad/Sum_10gradients/main_graph_0/hidden_1/Mul_grad/Shape_1*
T0*
Tshape0
©
9gradients/main_graph_0/hidden_1/Mul_grad/tuple/group_depsNoOp1^gradients/main_graph_0/hidden_1/Mul_grad/Reshape3^gradients/main_graph_0/hidden_1/Mul_grad/Reshape_1

Agradients/main_graph_0/hidden_1/Mul_grad/tuple/control_dependencyIdentity0gradients/main_graph_0/hidden_1/Mul_grad/Reshape:^gradients/main_graph_0/hidden_1/Mul_grad/tuple/group_deps*
T0*C
_class9
75loc:@gradients/main_graph_0/hidden_1/Mul_grad/Reshape

Cgradients/main_graph_0/hidden_1/Mul_grad/tuple/control_dependency_1Identity2gradients/main_graph_0/hidden_1/Mul_grad/Reshape_1:^gradients/main_graph_0/hidden_1/Mul_grad/tuple/group_deps*
T0*E
_class;
97loc:@gradients/main_graph_0/hidden_1/Mul_grad/Reshape_1
“
8gradients/main_graph_0/hidden_1/Sigmoid_grad/SigmoidGradSigmoidGradmain_graph_0/hidden_1/SigmoidCgradients/main_graph_0/hidden_1/Mul_grad/tuple/control_dependency_1*
T0
ģ
gradients/AddN_8AddNAgradients/main_graph_0/hidden_1/Mul_grad/tuple/control_dependency8gradients/main_graph_0/hidden_1/Sigmoid_grad/SigmoidGrad*
T0*C
_class9
75loc:@gradients/main_graph_0/hidden_1/Mul_grad/Reshape*
N
y
8gradients/main_graph_0/hidden_1/BiasAdd_grad/BiasAddGradBiasAddGradgradients/AddN_8*
T0*
data_formatNHWC

=gradients/main_graph_0/hidden_1/BiasAdd_grad/tuple/group_depsNoOp^gradients/AddN_89^gradients/main_graph_0/hidden_1/BiasAdd_grad/BiasAddGrad
ń
Egradients/main_graph_0/hidden_1/BiasAdd_grad/tuple/control_dependencyIdentitygradients/AddN_8>^gradients/main_graph_0/hidden_1/BiasAdd_grad/tuple/group_deps*
T0*C
_class9
75loc:@gradients/main_graph_0/hidden_1/Mul_grad/Reshape
£
Ggradients/main_graph_0/hidden_1/BiasAdd_grad/tuple/control_dependency_1Identity8gradients/main_graph_0/hidden_1/BiasAdd_grad/BiasAddGrad>^gradients/main_graph_0/hidden_1/BiasAdd_grad/tuple/group_deps*
T0*K
_classA
?=loc:@gradients/main_graph_0/hidden_1/BiasAdd_grad/BiasAddGrad
Õ
2gradients/main_graph_0/hidden_1/MatMul_grad/MatMulMatMulEgradients/main_graph_0/hidden_1/BiasAdd_grad/tuple/control_dependency!main_graph_0/hidden_1/kernel/read*
transpose_b(*
T0*
transpose_a( 
Ļ
4gradients/main_graph_0/hidden_1/MatMul_grad/MatMul_1MatMulmain_graph_0/hidden_0/MulEgradients/main_graph_0/hidden_1/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
°
<gradients/main_graph_0/hidden_1/MatMul_grad/tuple/group_depsNoOp3^gradients/main_graph_0/hidden_1/MatMul_grad/MatMul5^gradients/main_graph_0/hidden_1/MatMul_grad/MatMul_1

Dgradients/main_graph_0/hidden_1/MatMul_grad/tuple/control_dependencyIdentity2gradients/main_graph_0/hidden_1/MatMul_grad/MatMul=^gradients/main_graph_0/hidden_1/MatMul_grad/tuple/group_deps*
T0*E
_class;
97loc:@gradients/main_graph_0/hidden_1/MatMul_grad/MatMul

Fgradients/main_graph_0/hidden_1/MatMul_grad/tuple/control_dependency_1Identity4gradients/main_graph_0/hidden_1/MatMul_grad/MatMul_1=^gradients/main_graph_0/hidden_1/MatMul_grad/tuple/group_deps*
T0*G
_class=
;9loc:@gradients/main_graph_0/hidden_1/MatMul_grad/MatMul_1
o
.gradients/main_graph_0/hidden_0/Mul_grad/ShapeShapemain_graph_0/hidden_0/BiasAdd*
T0*
out_type0
q
0gradients/main_graph_0/hidden_0/Mul_grad/Shape_1Shapemain_graph_0/hidden_0/Sigmoid*
T0*
out_type0
Ā
>gradients/main_graph_0/hidden_0/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs.gradients/main_graph_0/hidden_0/Mul_grad/Shape0gradients/main_graph_0/hidden_0/Mul_grad/Shape_1*
T0
”
,gradients/main_graph_0/hidden_0/Mul_grad/MulMulDgradients/main_graph_0/hidden_1/MatMul_grad/tuple/control_dependencymain_graph_0/hidden_0/Sigmoid*
T0
Ē
,gradients/main_graph_0/hidden_0/Mul_grad/SumSum,gradients/main_graph_0/hidden_0/Mul_grad/Mul>gradients/main_graph_0/hidden_0/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
°
0gradients/main_graph_0/hidden_0/Mul_grad/ReshapeReshape,gradients/main_graph_0/hidden_0/Mul_grad/Sum.gradients/main_graph_0/hidden_0/Mul_grad/Shape*
T0*
Tshape0
£
.gradients/main_graph_0/hidden_0/Mul_grad/Mul_1Mulmain_graph_0/hidden_0/BiasAddDgradients/main_graph_0/hidden_1/MatMul_grad/tuple/control_dependency*
T0
Ķ
.gradients/main_graph_0/hidden_0/Mul_grad/Sum_1Sum.gradients/main_graph_0/hidden_0/Mul_grad/Mul_1@gradients/main_graph_0/hidden_0/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
¶
2gradients/main_graph_0/hidden_0/Mul_grad/Reshape_1Reshape.gradients/main_graph_0/hidden_0/Mul_grad/Sum_10gradients/main_graph_0/hidden_0/Mul_grad/Shape_1*
T0*
Tshape0
©
9gradients/main_graph_0/hidden_0/Mul_grad/tuple/group_depsNoOp1^gradients/main_graph_0/hidden_0/Mul_grad/Reshape3^gradients/main_graph_0/hidden_0/Mul_grad/Reshape_1

Agradients/main_graph_0/hidden_0/Mul_grad/tuple/control_dependencyIdentity0gradients/main_graph_0/hidden_0/Mul_grad/Reshape:^gradients/main_graph_0/hidden_0/Mul_grad/tuple/group_deps*
T0*C
_class9
75loc:@gradients/main_graph_0/hidden_0/Mul_grad/Reshape

Cgradients/main_graph_0/hidden_0/Mul_grad/tuple/control_dependency_1Identity2gradients/main_graph_0/hidden_0/Mul_grad/Reshape_1:^gradients/main_graph_0/hidden_0/Mul_grad/tuple/group_deps*
T0*E
_class;
97loc:@gradients/main_graph_0/hidden_0/Mul_grad/Reshape_1
“
8gradients/main_graph_0/hidden_0/Sigmoid_grad/SigmoidGradSigmoidGradmain_graph_0/hidden_0/SigmoidCgradients/main_graph_0/hidden_0/Mul_grad/tuple/control_dependency_1*
T0
ģ
gradients/AddN_9AddNAgradients/main_graph_0/hidden_0/Mul_grad/tuple/control_dependency8gradients/main_graph_0/hidden_0/Sigmoid_grad/SigmoidGrad*
T0*C
_class9
75loc:@gradients/main_graph_0/hidden_0/Mul_grad/Reshape*
N
y
8gradients/main_graph_0/hidden_0/BiasAdd_grad/BiasAddGradBiasAddGradgradients/AddN_9*
T0*
data_formatNHWC

=gradients/main_graph_0/hidden_0/BiasAdd_grad/tuple/group_depsNoOp^gradients/AddN_99^gradients/main_graph_0/hidden_0/BiasAdd_grad/BiasAddGrad
ń
Egradients/main_graph_0/hidden_0/BiasAdd_grad/tuple/control_dependencyIdentitygradients/AddN_9>^gradients/main_graph_0/hidden_0/BiasAdd_grad/tuple/group_deps*
T0*C
_class9
75loc:@gradients/main_graph_0/hidden_0/Mul_grad/Reshape
£
Ggradients/main_graph_0/hidden_0/BiasAdd_grad/tuple/control_dependency_1Identity8gradients/main_graph_0/hidden_0/BiasAdd_grad/BiasAddGrad>^gradients/main_graph_0/hidden_0/BiasAdd_grad/tuple/group_deps*
T0*K
_classA
?=loc:@gradients/main_graph_0/hidden_0/BiasAdd_grad/BiasAddGrad
Õ
2gradients/main_graph_0/hidden_0/MatMul_grad/MatMulMatMulEgradients/main_graph_0/hidden_0/BiasAdd_grad/tuple/control_dependency!main_graph_0/hidden_0/kernel/read*
transpose_b(*
T0*
transpose_a( 
Ę
4gradients/main_graph_0/hidden_0/MatMul_grad/MatMul_1MatMulnormalized_stateEgradients/main_graph_0/hidden_0/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
°
<gradients/main_graph_0/hidden_0/MatMul_grad/tuple/group_depsNoOp3^gradients/main_graph_0/hidden_0/MatMul_grad/MatMul5^gradients/main_graph_0/hidden_0/MatMul_grad/MatMul_1

Dgradients/main_graph_0/hidden_0/MatMul_grad/tuple/control_dependencyIdentity2gradients/main_graph_0/hidden_0/MatMul_grad/MatMul=^gradients/main_graph_0/hidden_0/MatMul_grad/tuple/group_deps*
T0*E
_class;
97loc:@gradients/main_graph_0/hidden_0/MatMul_grad/MatMul

Fgradients/main_graph_0/hidden_0/MatMul_grad/tuple/control_dependency_1Identity4gradients/main_graph_0/hidden_0/MatMul_grad/MatMul_1=^gradients/main_graph_0/hidden_0/MatMul_grad/tuple/group_deps*
T0*G
_class=
;9loc:@gradients/main_graph_0/hidden_0/MatMul_grad/MatMul_1
:
gradients_1/ShapeConst*
valueB *
dtype0
B
gradients_1/grad_ys_0Const*
valueB
 *  ?*
dtype0
]
gradients_1/FillFillgradients_1/Shapegradients_1/grad_ys_0*
T0*

index_type0
<
gradients_1/sub_8_grad/NegNeggradients_1/Fill*
T0
_
'gradients_1/sub_8_grad/tuple/group_depsNoOp^gradients_1/Fill^gradients_1/sub_8_grad/Neg
„
/gradients_1/sub_8_grad/tuple/control_dependencyIdentitygradients_1/Fill(^gradients_1/sub_8_grad/tuple/group_deps*
T0*#
_class
loc:@gradients_1/Fill
»
1gradients_1/sub_8_grad/tuple/control_dependency_1Identitygradients_1/sub_8_grad/Neg(^gradients_1/sub_8_grad/tuple/group_deps*
T0*-
_class#
!loc:@gradients_1/sub_8_grad/Neg
b
(gradients_1/add_15_grad/tuple/group_depsNoOp0^gradients_1/sub_8_grad/tuple/control_dependency
Ę
0gradients_1/add_15_grad/tuple/control_dependencyIdentity/gradients_1/sub_8_grad/tuple/control_dependency)^gradients_1/add_15_grad/tuple/group_deps*
T0*#
_class
loc:@gradients_1/Fill
Č
2gradients_1/add_15_grad/tuple/control_dependency_1Identity/gradients_1/sub_8_grad/tuple/control_dependency)^gradients_1/add_15_grad/tuple/group_deps*
T0*#
_class
loc:@gradients_1/Fill
e
gradients_1/mul_6_grad/MulMul1gradients_1/sub_8_grad/tuple/control_dependency_1Mean_6*
T0
r
gradients_1/mul_6_grad/Mul_1Mul1gradients_1/sub_8_grad/tuple/control_dependency_1PolynomialDecay_2*
T0
k
'gradients_1/mul_6_grad/tuple/group_depsNoOp^gradients_1/mul_6_grad/Mul^gradients_1/mul_6_grad/Mul_1
¹
/gradients_1/mul_6_grad/tuple/control_dependencyIdentitygradients_1/mul_6_grad/Mul(^gradients_1/mul_6_grad/tuple/group_deps*
T0*-
_class#
!loc:@gradients_1/mul_6_grad/Mul
æ
1gradients_1/mul_6_grad/tuple/control_dependency_1Identitygradients_1/mul_6_grad/Mul_1(^gradients_1/mul_6_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients_1/mul_6_grad/Mul_1
\
gradients_1/Neg_4_grad/NegNeg0gradients_1/add_15_grad/tuple/control_dependency*
T0
f
gradients_1/mul_5_grad/MulMul2gradients_1/add_15_grad/tuple/control_dependency_1Mean_4*
T0
i
gradients_1/mul_5_grad/Mul_1Mul2gradients_1/add_15_grad/tuple/control_dependency_1mul_5/x*
T0
k
'gradients_1/mul_5_grad/tuple/group_depsNoOp^gradients_1/mul_5_grad/Mul^gradients_1/mul_5_grad/Mul_1
¹
/gradients_1/mul_5_grad/tuple/control_dependencyIdentitygradients_1/mul_5_grad/Mul(^gradients_1/mul_5_grad/tuple/group_deps*
T0*-
_class#
!loc:@gradients_1/mul_5_grad/Mul
æ
1gradients_1/mul_5_grad/tuple/control_dependency_1Identitygradients_1/mul_5_grad/Mul_1(^gradients_1/mul_5_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients_1/mul_5_grad/Mul_1
S
%gradients_1/Mean_6_grad/Reshape/shapeConst*
valueB:*
dtype0

gradients_1/Mean_6_grad/ReshapeReshape1gradients_1/mul_6_grad/tuple/control_dependency_1%gradients_1/Mean_6_grad/Reshape/shape*
T0*
Tshape0
U
gradients_1/Mean_6_grad/ShapeShapeDynamicPartition_3:1*
T0*
out_type0

gradients_1/Mean_6_grad/TileTilegradients_1/Mean_6_grad/Reshapegradients_1/Mean_6_grad/Shape*

Tmultiples0*
T0
W
gradients_1/Mean_6_grad/Shape_1ShapeDynamicPartition_3:1*
T0*
out_type0
H
gradients_1/Mean_6_grad/Shape_2Const*
valueB *
dtype0
K
gradients_1/Mean_6_grad/ConstConst*
valueB: *
dtype0

gradients_1/Mean_6_grad/ProdProdgradients_1/Mean_6_grad/Shape_1gradients_1/Mean_6_grad/Const*

Tidx0*
	keep_dims( *
T0
M
gradients_1/Mean_6_grad/Const_1Const*
valueB: *
dtype0

gradients_1/Mean_6_grad/Prod_1Prodgradients_1/Mean_6_grad/Shape_2gradients_1/Mean_6_grad/Const_1*

Tidx0*
	keep_dims( *
T0
K
!gradients_1/Mean_6_grad/Maximum/yConst*
value	B :*
dtype0
v
gradients_1/Mean_6_grad/MaximumMaximumgradients_1/Mean_6_grad/Prod_1!gradients_1/Mean_6_grad/Maximum/y*
T0
t
 gradients_1/Mean_6_grad/floordivFloorDivgradients_1/Mean_6_grad/Prodgradients_1/Mean_6_grad/Maximum*
T0
n
gradients_1/Mean_6_grad/CastCast gradients_1/Mean_6_grad/floordiv*

SrcT0*
Truncate( *

DstT0
o
gradients_1/Mean_6_grad/truedivRealDivgradients_1/Mean_6_grad/Tilegradients_1/Mean_6_grad/Cast*
T0
Z
%gradients_1/Mean_5_grad/Reshape/shapeConst*
valueB"      *
dtype0

gradients_1/Mean_5_grad/ReshapeReshapegradients_1/Neg_4_grad/Neg%gradients_1/Mean_5_grad/Reshape/shape*
T0*
Tshape0
U
gradients_1/Mean_5_grad/ShapeShapeDynamicPartition_2:1*
T0*
out_type0

gradients_1/Mean_5_grad/TileTilegradients_1/Mean_5_grad/Reshapegradients_1/Mean_5_grad/Shape*

Tmultiples0*
T0
W
gradients_1/Mean_5_grad/Shape_1ShapeDynamicPartition_2:1*
T0*
out_type0
H
gradients_1/Mean_5_grad/Shape_2Const*
valueB *
dtype0
K
gradients_1/Mean_5_grad/ConstConst*
valueB: *
dtype0

gradients_1/Mean_5_grad/ProdProdgradients_1/Mean_5_grad/Shape_1gradients_1/Mean_5_grad/Const*

Tidx0*
	keep_dims( *
T0
M
gradients_1/Mean_5_grad/Const_1Const*
valueB: *
dtype0

gradients_1/Mean_5_grad/Prod_1Prodgradients_1/Mean_5_grad/Shape_2gradients_1/Mean_5_grad/Const_1*

Tidx0*
	keep_dims( *
T0
K
!gradients_1/Mean_5_grad/Maximum/yConst*
value	B :*
dtype0
v
gradients_1/Mean_5_grad/MaximumMaximumgradients_1/Mean_5_grad/Prod_1!gradients_1/Mean_5_grad/Maximum/y*
T0
t
 gradients_1/Mean_5_grad/floordivFloorDivgradients_1/Mean_5_grad/Prodgradients_1/Mean_5_grad/Maximum*
T0
n
gradients_1/Mean_5_grad/CastCast gradients_1/Mean_5_grad/floordiv*

SrcT0*
Truncate( *

DstT0
o
gradients_1/Mean_5_grad/truedivRealDivgradients_1/Mean_5_grad/Tilegradients_1/Mean_5_grad/Cast*
T0
S
%gradients_1/Mean_4_grad/Reshape/shapeConst*
valueB:*
dtype0

gradients_1/Mean_4_grad/ReshapeReshape1gradients_1/mul_5_grad/tuple/control_dependency_1%gradients_1/Mean_4_grad/Reshape/shape*
T0*
Tshape0
K
gradients_1/Mean_4_grad/ConstConst*
valueB:*
dtype0

gradients_1/Mean_4_grad/TileTilegradients_1/Mean_4_grad/Reshapegradients_1/Mean_4_grad/Const*

Tmultiples0*
T0
L
gradients_1/Mean_4_grad/Const_1Const*
valueB
 *   @*
dtype0
r
gradients_1/Mean_4_grad/truedivRealDivgradients_1/Mean_4_grad/Tilegradients_1/Mean_4_grad/Const_1*
T0
@
gradients_1/zeros_like	ZerosLikeDynamicPartition_3*
T0
Q
)gradients_1/DynamicPartition_3_grad/ShapeShapeCast*
T0*
out_type0
W
)gradients_1/DynamicPartition_3_grad/ConstConst*
valueB: *
dtype0
¬
(gradients_1/DynamicPartition_3_grad/ProdProd)gradients_1/DynamicPartition_3_grad/Shape)gradients_1/DynamicPartition_3_grad/Const*

Tidx0*
	keep_dims( *
T0
Y
/gradients_1/DynamicPartition_3_grad/range/startConst*
value	B : *
dtype0
Y
/gradients_1/DynamicPartition_3_grad/range/deltaConst*
value	B :*
dtype0
Ź
)gradients_1/DynamicPartition_3_grad/rangeRange/gradients_1/DynamicPartition_3_grad/range/start(gradients_1/DynamicPartition_3_grad/Prod/gradients_1/DynamicPartition_3_grad/range/delta*

Tidx0
£
+gradients_1/DynamicPartition_3_grad/ReshapeReshape)gradients_1/DynamicPartition_3_grad/range)gradients_1/DynamicPartition_3_grad/Shape*
T0*
Tshape0

4gradients_1/DynamicPartition_3_grad/DynamicPartitionDynamicPartition+gradients_1/DynamicPartition_3_grad/ReshapeCast*
num_partitions*
T0
ū
1gradients_1/DynamicPartition_3_grad/DynamicStitchDynamicStitch4gradients_1/DynamicPartition_3_grad/DynamicPartition6gradients_1/DynamicPartition_3_grad/DynamicPartition:1gradients_1/zeros_likegradients_1/Mean_6_grad/truediv*
T0*
N
T
+gradients_1/DynamicPartition_3_grad/Shape_1ShapeSum_2*
T0*
out_type0
Æ
-gradients_1/DynamicPartition_3_grad/Reshape_1Reshape1gradients_1/DynamicPartition_3_grad/DynamicStitch+gradients_1/DynamicPartition_3_grad/Shape_1*
T0*
Tshape0
B
gradients_1/zeros_like_1	ZerosLikeDynamicPartition_2*
T0
Q
)gradients_1/DynamicPartition_2_grad/ShapeShapeCast*
T0*
out_type0
W
)gradients_1/DynamicPartition_2_grad/ConstConst*
valueB: *
dtype0
¬
(gradients_1/DynamicPartition_2_grad/ProdProd)gradients_1/DynamicPartition_2_grad/Shape)gradients_1/DynamicPartition_2_grad/Const*

Tidx0*
	keep_dims( *
T0
Y
/gradients_1/DynamicPartition_2_grad/range/startConst*
value	B : *
dtype0
Y
/gradients_1/DynamicPartition_2_grad/range/deltaConst*
value	B :*
dtype0
Ź
)gradients_1/DynamicPartition_2_grad/rangeRange/gradients_1/DynamicPartition_2_grad/range/start(gradients_1/DynamicPartition_2_grad/Prod/gradients_1/DynamicPartition_2_grad/range/delta*

Tidx0
£
+gradients_1/DynamicPartition_2_grad/ReshapeReshape)gradients_1/DynamicPartition_2_grad/range)gradients_1/DynamicPartition_2_grad/Shape*
T0*
Tshape0

4gradients_1/DynamicPartition_2_grad/DynamicPartitionDynamicPartition+gradients_1/DynamicPartition_2_grad/ReshapeCast*
num_partitions*
T0
ż
1gradients_1/DynamicPartition_2_grad/DynamicStitchDynamicStitch4gradients_1/DynamicPartition_2_grad/DynamicPartition6gradients_1/DynamicPartition_2_grad/DynamicPartition:1gradients_1/zeros_like_1gradients_1/Mean_5_grad/truediv*
T0*
N
V
+gradients_1/DynamicPartition_2_grad/Shape_1ShapeMinimum*
T0*
out_type0
Æ
-gradients_1/DynamicPartition_2_grad/Reshape_1Reshape1gradients_1/DynamicPartition_2_grad/DynamicStitch+gradients_1/DynamicPartition_2_grad/Shape_1*
T0*
Tshape0
p
%gradients_1/Mean_4/input_grad/unstackUnpackgradients_1/Mean_4_grad/truediv*
T0*	
num*

axis 
^
.gradients_1/Mean_4/input_grad/tuple/group_depsNoOp&^gradients_1/Mean_4/input_grad/unstack
Ż
6gradients_1/Mean_4/input_grad/tuple/control_dependencyIdentity%gradients_1/Mean_4/input_grad/unstack/^gradients_1/Mean_4/input_grad/tuple/group_deps*
T0*8
_class.
,*loc:@gradients_1/Mean_4/input_grad/unstack
į
8gradients_1/Mean_4/input_grad/tuple/control_dependency_1Identity'gradients_1/Mean_4/input_grad/unstack:1/^gradients_1/Mean_4/input_grad/tuple/group_deps*
T0*8
_class.
,*loc:@gradients_1/Mean_4/input_grad/unstack
E
gradients_1/Sum_2_grad/ShapeShapestack*
T0*
out_type0
v
gradients_1/Sum_2_grad/SizeConst*/
_class%
#!loc:@gradients_1/Sum_2_grad/Shape*
value	B :*
dtype0

gradients_1/Sum_2_grad/addAddV2Sum_2/reduction_indicesgradients_1/Sum_2_grad/Size*
T0*/
_class%
#!loc:@gradients_1/Sum_2_grad/Shape

gradients_1/Sum_2_grad/modFloorModgradients_1/Sum_2_grad/addgradients_1/Sum_2_grad/Size*
T0*/
_class%
#!loc:@gradients_1/Sum_2_grad/Shape
x
gradients_1/Sum_2_grad/Shape_1Const*/
_class%
#!loc:@gradients_1/Sum_2_grad/Shape*
valueB *
dtype0
}
"gradients_1/Sum_2_grad/range/startConst*/
_class%
#!loc:@gradients_1/Sum_2_grad/Shape*
value	B : *
dtype0
}
"gradients_1/Sum_2_grad/range/deltaConst*/
_class%
#!loc:@gradients_1/Sum_2_grad/Shape*
value	B :*
dtype0
Ē
gradients_1/Sum_2_grad/rangeRange"gradients_1/Sum_2_grad/range/startgradients_1/Sum_2_grad/Size"gradients_1/Sum_2_grad/range/delta*

Tidx0*/
_class%
#!loc:@gradients_1/Sum_2_grad/Shape
|
!gradients_1/Sum_2_grad/Fill/valueConst*/
_class%
#!loc:@gradients_1/Sum_2_grad/Shape*
value	B :*
dtype0
²
gradients_1/Sum_2_grad/FillFillgradients_1/Sum_2_grad/Shape_1!gradients_1/Sum_2_grad/Fill/value*
T0*/
_class%
#!loc:@gradients_1/Sum_2_grad/Shape*

index_type0
ķ
$gradients_1/Sum_2_grad/DynamicStitchDynamicStitchgradients_1/Sum_2_grad/rangegradients_1/Sum_2_grad/modgradients_1/Sum_2_grad/Shapegradients_1/Sum_2_grad/Fill*
T0*/
_class%
#!loc:@gradients_1/Sum_2_grad/Shape*
N
{
 gradients_1/Sum_2_grad/Maximum/yConst*/
_class%
#!loc:@gradients_1/Sum_2_grad/Shape*
value	B :*
dtype0
«
gradients_1/Sum_2_grad/MaximumMaximum$gradients_1/Sum_2_grad/DynamicStitch gradients_1/Sum_2_grad/Maximum/y*
T0*/
_class%
#!loc:@gradients_1/Sum_2_grad/Shape
£
gradients_1/Sum_2_grad/floordivFloorDivgradients_1/Sum_2_grad/Shapegradients_1/Sum_2_grad/Maximum*
T0*/
_class%
#!loc:@gradients_1/Sum_2_grad/Shape

gradients_1/Sum_2_grad/ReshapeReshape-gradients_1/DynamicPartition_3_grad/Reshape_1$gradients_1/Sum_2_grad/DynamicStitch*
T0*
Tshape0

gradients_1/Sum_2_grad/TileTilegradients_1/Sum_2_grad/Reshapegradients_1/Sum_2_grad/floordiv*

Tmultiples0*
T0
G
gradients_1/Minimum_grad/ShapeShapemul_3*
T0*
out_type0
I
 gradients_1/Minimum_grad/Shape_1Shapemul_4*
T0*
out_type0
q
 gradients_1/Minimum_grad/Shape_2Shape-gradients_1/DynamicPartition_2_grad/Reshape_1*
T0*
out_type0
Q
$gradients_1/Minimum_grad/zeros/ConstConst*
valueB
 *    *
dtype0

gradients_1/Minimum_grad/zerosFill gradients_1/Minimum_grad/Shape_2$gradients_1/Minimum_grad/zeros/Const*
T0*

index_type0
F
"gradients_1/Minimum_grad/LessEqual	LessEqualmul_3mul_4*
T0

.gradients_1/Minimum_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/Minimum_grad/Shape gradients_1/Minimum_grad/Shape_1*
T0
„
gradients_1/Minimum_grad/SelectSelect"gradients_1/Minimum_grad/LessEqual-gradients_1/DynamicPartition_2_grad/Reshape_1gradients_1/Minimum_grad/zeros*
T0

gradients_1/Minimum_grad/SumSumgradients_1/Minimum_grad/Select.gradients_1/Minimum_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0

 gradients_1/Minimum_grad/ReshapeReshapegradients_1/Minimum_grad/Sumgradients_1/Minimum_grad/Shape*
T0*
Tshape0
§
!gradients_1/Minimum_grad/Select_1Select"gradients_1/Minimum_grad/LessEqualgradients_1/Minimum_grad/zeros-gradients_1/DynamicPartition_2_grad/Reshape_1*
T0
 
gradients_1/Minimum_grad/Sum_1Sum!gradients_1/Minimum_grad/Select_10gradients_1/Minimum_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0

"gradients_1/Minimum_grad/Reshape_1Reshapegradients_1/Minimum_grad/Sum_1 gradients_1/Minimum_grad/Shape_1*
T0*
Tshape0
y
)gradients_1/Minimum_grad/tuple/group_depsNoOp!^gradients_1/Minimum_grad/Reshape#^gradients_1/Minimum_grad/Reshape_1
É
1gradients_1/Minimum_grad/tuple/control_dependencyIdentity gradients_1/Minimum_grad/Reshape*^gradients_1/Minimum_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_1/Minimum_grad/Reshape
Ļ
3gradients_1/Minimum_grad/tuple/control_dependency_1Identity"gradients_1/Minimum_grad/Reshape_1*^gradients_1/Minimum_grad/tuple/group_deps*
T0*5
_class+
)'loc:@gradients_1/Minimum_grad/Reshape_1
S
%gradients_1/Mean_2_grad/Reshape/shapeConst*
valueB:*
dtype0
 
gradients_1/Mean_2_grad/ReshapeReshape6gradients_1/Mean_4/input_grad/tuple/control_dependency%gradients_1/Mean_2_grad/Reshape/shape*
T0*
Tshape0
S
gradients_1/Mean_2_grad/ShapeShapeDynamicPartition:1*
T0*
out_type0

gradients_1/Mean_2_grad/TileTilegradients_1/Mean_2_grad/Reshapegradients_1/Mean_2_grad/Shape*

Tmultiples0*
T0
U
gradients_1/Mean_2_grad/Shape_1ShapeDynamicPartition:1*
T0*
out_type0
H
gradients_1/Mean_2_grad/Shape_2Const*
valueB *
dtype0
K
gradients_1/Mean_2_grad/ConstConst*
valueB: *
dtype0

gradients_1/Mean_2_grad/ProdProdgradients_1/Mean_2_grad/Shape_1gradients_1/Mean_2_grad/Const*

Tidx0*
	keep_dims( *
T0
M
gradients_1/Mean_2_grad/Const_1Const*
valueB: *
dtype0

gradients_1/Mean_2_grad/Prod_1Prodgradients_1/Mean_2_grad/Shape_2gradients_1/Mean_2_grad/Const_1*

Tidx0*
	keep_dims( *
T0
K
!gradients_1/Mean_2_grad/Maximum/yConst*
value	B :*
dtype0
v
gradients_1/Mean_2_grad/MaximumMaximumgradients_1/Mean_2_grad/Prod_1!gradients_1/Mean_2_grad/Maximum/y*
T0
t
 gradients_1/Mean_2_grad/floordivFloorDivgradients_1/Mean_2_grad/Prodgradients_1/Mean_2_grad/Maximum*
T0
n
gradients_1/Mean_2_grad/CastCast gradients_1/Mean_2_grad/floordiv*

SrcT0*
Truncate( *

DstT0
o
gradients_1/Mean_2_grad/truedivRealDivgradients_1/Mean_2_grad/Tilegradients_1/Mean_2_grad/Cast*
T0
S
%gradients_1/Mean_3_grad/Reshape/shapeConst*
valueB:*
dtype0
¢
gradients_1/Mean_3_grad/ReshapeReshape8gradients_1/Mean_4/input_grad/tuple/control_dependency_1%gradients_1/Mean_3_grad/Reshape/shape*
T0*
Tshape0
U
gradients_1/Mean_3_grad/ShapeShapeDynamicPartition_1:1*
T0*
out_type0

gradients_1/Mean_3_grad/TileTilegradients_1/Mean_3_grad/Reshapegradients_1/Mean_3_grad/Shape*

Tmultiples0*
T0
W
gradients_1/Mean_3_grad/Shape_1ShapeDynamicPartition_1:1*
T0*
out_type0
H
gradients_1/Mean_3_grad/Shape_2Const*
valueB *
dtype0
K
gradients_1/Mean_3_grad/ConstConst*
valueB: *
dtype0

gradients_1/Mean_3_grad/ProdProdgradients_1/Mean_3_grad/Shape_1gradients_1/Mean_3_grad/Const*

Tidx0*
	keep_dims( *
T0
M
gradients_1/Mean_3_grad/Const_1Const*
valueB: *
dtype0

gradients_1/Mean_3_grad/Prod_1Prodgradients_1/Mean_3_grad/Shape_2gradients_1/Mean_3_grad/Const_1*

Tidx0*
	keep_dims( *
T0
K
!gradients_1/Mean_3_grad/Maximum/yConst*
value	B :*
dtype0
v
gradients_1/Mean_3_grad/MaximumMaximumgradients_1/Mean_3_grad/Prod_1!gradients_1/Mean_3_grad/Maximum/y*
T0
t
 gradients_1/Mean_3_grad/floordivFloorDivgradients_1/Mean_3_grad/Prodgradients_1/Mean_3_grad/Maximum*
T0
n
gradients_1/Mean_3_grad/CastCast gradients_1/Mean_3_grad/floordiv*

SrcT0*
Truncate( *

DstT0
o
gradients_1/Mean_3_grad/truedivRealDivgradients_1/Mean_3_grad/Tilegradients_1/Mean_3_grad/Cast*
T0
e
gradients_1/stack_grad/unstackUnpackgradients_1/Sum_2_grad/Tile*
T0*	
num*

axis
C
gradients_1/mul_3_grad/ShapeShapeExp*
T0*
out_type0
L
gradients_1/mul_3_grad/Shape_1Shape
ExpandDims*
T0*
out_type0

,gradients_1/mul_3_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/mul_3_grad/Shapegradients_1/mul_3_grad/Shape_1*
T0
i
gradients_1/mul_3_grad/MulMul1gradients_1/Minimum_grad/tuple/control_dependency
ExpandDims*
T0

gradients_1/mul_3_grad/SumSumgradients_1/mul_3_grad/Mul,gradients_1/mul_3_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
z
gradients_1/mul_3_grad/ReshapeReshapegradients_1/mul_3_grad/Sumgradients_1/mul_3_grad/Shape*
T0*
Tshape0
d
gradients_1/mul_3_grad/Mul_1MulExp1gradients_1/Minimum_grad/tuple/control_dependency*
T0

gradients_1/mul_3_grad/Sum_1Sumgradients_1/mul_3_grad/Mul_1.gradients_1/mul_3_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0

 gradients_1/mul_3_grad/Reshape_1Reshapegradients_1/mul_3_grad/Sum_1gradients_1/mul_3_grad/Shape_1*
T0*
Tshape0
s
'gradients_1/mul_3_grad/tuple/group_depsNoOp^gradients_1/mul_3_grad/Reshape!^gradients_1/mul_3_grad/Reshape_1
Į
/gradients_1/mul_3_grad/tuple/control_dependencyIdentitygradients_1/mul_3_grad/Reshape(^gradients_1/mul_3_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_1/mul_3_grad/Reshape
Ē
1gradients_1/mul_3_grad/tuple/control_dependency_1Identity gradients_1/mul_3_grad/Reshape_1(^gradients_1/mul_3_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_1/mul_3_grad/Reshape_1
O
gradients_1/mul_4_grad/ShapeShapeclip_by_value_2*
T0*
out_type0
L
gradients_1/mul_4_grad/Shape_1Shape
ExpandDims*
T0*
out_type0

,gradients_1/mul_4_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/mul_4_grad/Shapegradients_1/mul_4_grad/Shape_1*
T0
k
gradients_1/mul_4_grad/MulMul3gradients_1/Minimum_grad/tuple/control_dependency_1
ExpandDims*
T0

gradients_1/mul_4_grad/SumSumgradients_1/mul_4_grad/Mul,gradients_1/mul_4_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
z
gradients_1/mul_4_grad/ReshapeReshapegradients_1/mul_4_grad/Sumgradients_1/mul_4_grad/Shape*
T0*
Tshape0
r
gradients_1/mul_4_grad/Mul_1Mulclip_by_value_23gradients_1/Minimum_grad/tuple/control_dependency_1*
T0

gradients_1/mul_4_grad/Sum_1Sumgradients_1/mul_4_grad/Mul_1.gradients_1/mul_4_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0

 gradients_1/mul_4_grad/Reshape_1Reshapegradients_1/mul_4_grad/Sum_1gradients_1/mul_4_grad/Shape_1*
T0*
Tshape0
s
'gradients_1/mul_4_grad/tuple/group_depsNoOp^gradients_1/mul_4_grad/Reshape!^gradients_1/mul_4_grad/Reshape_1
Į
/gradients_1/mul_4_grad/tuple/control_dependencyIdentitygradients_1/mul_4_grad/Reshape(^gradients_1/mul_4_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_1/mul_4_grad/Reshape
Ē
1gradients_1/mul_4_grad/tuple/control_dependency_1Identity gradients_1/mul_4_grad/Reshape_1(^gradients_1/mul_4_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_1/mul_4_grad/Reshape_1
@
gradients_1/zeros_like_2	ZerosLikeDynamicPartition*
T0
O
'gradients_1/DynamicPartition_grad/ShapeShapeCast*
T0*
out_type0
U
'gradients_1/DynamicPartition_grad/ConstConst*
valueB: *
dtype0
¦
&gradients_1/DynamicPartition_grad/ProdProd'gradients_1/DynamicPartition_grad/Shape'gradients_1/DynamicPartition_grad/Const*

Tidx0*
	keep_dims( *
T0
W
-gradients_1/DynamicPartition_grad/range/startConst*
value	B : *
dtype0
W
-gradients_1/DynamicPartition_grad/range/deltaConst*
value	B :*
dtype0
Ā
'gradients_1/DynamicPartition_grad/rangeRange-gradients_1/DynamicPartition_grad/range/start&gradients_1/DynamicPartition_grad/Prod-gradients_1/DynamicPartition_grad/range/delta*

Tidx0

)gradients_1/DynamicPartition_grad/ReshapeReshape'gradients_1/DynamicPartition_grad/range'gradients_1/DynamicPartition_grad/Shape*
T0*
Tshape0

2gradients_1/DynamicPartition_grad/DynamicPartitionDynamicPartition)gradients_1/DynamicPartition_grad/ReshapeCast*
num_partitions*
T0
÷
/gradients_1/DynamicPartition_grad/DynamicStitchDynamicStitch2gradients_1/DynamicPartition_grad/DynamicPartition4gradients_1/DynamicPartition_grad/DynamicPartition:1gradients_1/zeros_like_2gradients_1/Mean_2_grad/truediv*
T0*
N
T
)gradients_1/DynamicPartition_grad/Shape_1ShapeMaximum*
T0*
out_type0
©
+gradients_1/DynamicPartition_grad/Reshape_1Reshape/gradients_1/DynamicPartition_grad/DynamicStitch)gradients_1/DynamicPartition_grad/Shape_1*
T0*
Tshape0
B
gradients_1/zeros_like_3	ZerosLikeDynamicPartition_1*
T0
Q
)gradients_1/DynamicPartition_1_grad/ShapeShapeCast*
T0*
out_type0
W
)gradients_1/DynamicPartition_1_grad/ConstConst*
valueB: *
dtype0
¬
(gradients_1/DynamicPartition_1_grad/ProdProd)gradients_1/DynamicPartition_1_grad/Shape)gradients_1/DynamicPartition_1_grad/Const*

Tidx0*
	keep_dims( *
T0
Y
/gradients_1/DynamicPartition_1_grad/range/startConst*
value	B : *
dtype0
Y
/gradients_1/DynamicPartition_1_grad/range/deltaConst*
value	B :*
dtype0
Ź
)gradients_1/DynamicPartition_1_grad/rangeRange/gradients_1/DynamicPartition_1_grad/range/start(gradients_1/DynamicPartition_1_grad/Prod/gradients_1/DynamicPartition_1_grad/range/delta*

Tidx0
£
+gradients_1/DynamicPartition_1_grad/ReshapeReshape)gradients_1/DynamicPartition_1_grad/range)gradients_1/DynamicPartition_1_grad/Shape*
T0*
Tshape0

4gradients_1/DynamicPartition_1_grad/DynamicPartitionDynamicPartition+gradients_1/DynamicPartition_1_grad/ReshapeCast*
num_partitions*
T0
ż
1gradients_1/DynamicPartition_1_grad/DynamicStitchDynamicStitch4gradients_1/DynamicPartition_1_grad/DynamicPartition6gradients_1/DynamicPartition_1_grad/DynamicPartition:1gradients_1/zeros_like_3gradients_1/Mean_3_grad/truediv*
T0*
N
X
+gradients_1/DynamicPartition_1_grad/Shape_1Shape	Maximum_1*
T0*
out_type0
Æ
-gradients_1/DynamicPartition_1_grad/Reshape_1Reshape1gradients_1/DynamicPartition_1_grad/DynamicStitch+gradients_1/DynamicPartition_1_grad/Shape_1*
T0*
Tshape0

Bgradients_1/softmax_cross_entropy_with_logits/Reshape_2_grad/ShapeShape!softmax_cross_entropy_with_logits*
T0*
out_type0
Ź
Dgradients_1/softmax_cross_entropy_with_logits/Reshape_2_grad/ReshapeReshapegradients_1/stack_grad/unstackBgradients_1/softmax_cross_entropy_with_logits/Reshape_2_grad/Shape*
T0*
Tshape0
a
&gradients_1/clip_by_value_2_grad/ShapeShapeclip_by_value_2/Minimum*
T0*
out_type0
Q
(gradients_1/clip_by_value_2_grad/Shape_1Const*
valueB *
dtype0
{
(gradients_1/clip_by_value_2_grad/Shape_2Shape/gradients_1/mul_4_grad/tuple/control_dependency*
T0*
out_type0
Y
,gradients_1/clip_by_value_2_grad/zeros/ConstConst*
valueB
 *    *
dtype0
”
&gradients_1/clip_by_value_2_grad/zerosFill(gradients_1/clip_by_value_2_grad/Shape_2,gradients_1/clip_by_value_2_grad/zeros/Const*
T0*

index_type0
f
-gradients_1/clip_by_value_2_grad/GreaterEqualGreaterEqualclip_by_value_2/Minimumsub_7*
T0
Ŗ
6gradients_1/clip_by_value_2_grad/BroadcastGradientArgsBroadcastGradientArgs&gradients_1/clip_by_value_2_grad/Shape(gradients_1/clip_by_value_2_grad/Shape_1*
T0
Ā
'gradients_1/clip_by_value_2_grad/SelectSelect-gradients_1/clip_by_value_2_grad/GreaterEqual/gradients_1/mul_4_grad/tuple/control_dependency&gradients_1/clip_by_value_2_grad/zeros*
T0
²
$gradients_1/clip_by_value_2_grad/SumSum'gradients_1/clip_by_value_2_grad/Select6gradients_1/clip_by_value_2_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0

(gradients_1/clip_by_value_2_grad/ReshapeReshape$gradients_1/clip_by_value_2_grad/Sum&gradients_1/clip_by_value_2_grad/Shape*
T0*
Tshape0
Ä
)gradients_1/clip_by_value_2_grad/Select_1Select-gradients_1/clip_by_value_2_grad/GreaterEqual&gradients_1/clip_by_value_2_grad/zeros/gradients_1/mul_4_grad/tuple/control_dependency*
T0
ø
&gradients_1/clip_by_value_2_grad/Sum_1Sum)gradients_1/clip_by_value_2_grad/Select_18gradients_1/clip_by_value_2_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0

*gradients_1/clip_by_value_2_grad/Reshape_1Reshape&gradients_1/clip_by_value_2_grad/Sum_1(gradients_1/clip_by_value_2_grad/Shape_1*
T0*
Tshape0

1gradients_1/clip_by_value_2_grad/tuple/group_depsNoOp)^gradients_1/clip_by_value_2_grad/Reshape+^gradients_1/clip_by_value_2_grad/Reshape_1
é
9gradients_1/clip_by_value_2_grad/tuple/control_dependencyIdentity(gradients_1/clip_by_value_2_grad/Reshape2^gradients_1/clip_by_value_2_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients_1/clip_by_value_2_grad/Reshape
ļ
;gradients_1/clip_by_value_2_grad/tuple/control_dependency_1Identity*gradients_1/clip_by_value_2_grad/Reshape_12^gradients_1/clip_by_value_2_grad/tuple/group_deps*
T0*=
_class3
1/loc:@gradients_1/clip_by_value_2_grad/Reshape_1
S
gradients_1/Maximum_grad/ShapeShapeSquaredDifference*
T0*
out_type0
W
 gradients_1/Maximum_grad/Shape_1ShapeSquaredDifference_1*
T0*
out_type0
o
 gradients_1/Maximum_grad/Shape_2Shape+gradients_1/DynamicPartition_grad/Reshape_1*
T0*
out_type0
Q
$gradients_1/Maximum_grad/zeros/ConstConst*
valueB
 *    *
dtype0

gradients_1/Maximum_grad/zerosFill gradients_1/Maximum_grad/Shape_2$gradients_1/Maximum_grad/zeros/Const*
T0*

index_type0
f
%gradients_1/Maximum_grad/GreaterEqualGreaterEqualSquaredDifferenceSquaredDifference_1*
T0

.gradients_1/Maximum_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/Maximum_grad/Shape gradients_1/Maximum_grad/Shape_1*
T0
¦
gradients_1/Maximum_grad/SelectSelect%gradients_1/Maximum_grad/GreaterEqual+gradients_1/DynamicPartition_grad/Reshape_1gradients_1/Maximum_grad/zeros*
T0

gradients_1/Maximum_grad/SumSumgradients_1/Maximum_grad/Select.gradients_1/Maximum_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0

 gradients_1/Maximum_grad/ReshapeReshapegradients_1/Maximum_grad/Sumgradients_1/Maximum_grad/Shape*
T0*
Tshape0
Ø
!gradients_1/Maximum_grad/Select_1Select%gradients_1/Maximum_grad/GreaterEqualgradients_1/Maximum_grad/zeros+gradients_1/DynamicPartition_grad/Reshape_1*
T0
 
gradients_1/Maximum_grad/Sum_1Sum!gradients_1/Maximum_grad/Select_10gradients_1/Maximum_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0

"gradients_1/Maximum_grad/Reshape_1Reshapegradients_1/Maximum_grad/Sum_1 gradients_1/Maximum_grad/Shape_1*
T0*
Tshape0
y
)gradients_1/Maximum_grad/tuple/group_depsNoOp!^gradients_1/Maximum_grad/Reshape#^gradients_1/Maximum_grad/Reshape_1
É
1gradients_1/Maximum_grad/tuple/control_dependencyIdentity gradients_1/Maximum_grad/Reshape*^gradients_1/Maximum_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_1/Maximum_grad/Reshape
Ļ
3gradients_1/Maximum_grad/tuple/control_dependency_1Identity"gradients_1/Maximum_grad/Reshape_1*^gradients_1/Maximum_grad/tuple/group_deps*
T0*5
_class+
)'loc:@gradients_1/Maximum_grad/Reshape_1
W
 gradients_1/Maximum_1_grad/ShapeShapeSquaredDifference_2*
T0*
out_type0
Y
"gradients_1/Maximum_1_grad/Shape_1ShapeSquaredDifference_3*
T0*
out_type0
s
"gradients_1/Maximum_1_grad/Shape_2Shape-gradients_1/DynamicPartition_1_grad/Reshape_1*
T0*
out_type0
S
&gradients_1/Maximum_1_grad/zeros/ConstConst*
valueB
 *    *
dtype0

 gradients_1/Maximum_1_grad/zerosFill"gradients_1/Maximum_1_grad/Shape_2&gradients_1/Maximum_1_grad/zeros/Const*
T0*

index_type0
j
'gradients_1/Maximum_1_grad/GreaterEqualGreaterEqualSquaredDifference_2SquaredDifference_3*
T0

0gradients_1/Maximum_1_grad/BroadcastGradientArgsBroadcastGradientArgs gradients_1/Maximum_1_grad/Shape"gradients_1/Maximum_1_grad/Shape_1*
T0
®
!gradients_1/Maximum_1_grad/SelectSelect'gradients_1/Maximum_1_grad/GreaterEqual-gradients_1/DynamicPartition_1_grad/Reshape_1 gradients_1/Maximum_1_grad/zeros*
T0
 
gradients_1/Maximum_1_grad/SumSum!gradients_1/Maximum_1_grad/Select0gradients_1/Maximum_1_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0

"gradients_1/Maximum_1_grad/ReshapeReshapegradients_1/Maximum_1_grad/Sum gradients_1/Maximum_1_grad/Shape*
T0*
Tshape0
°
#gradients_1/Maximum_1_grad/Select_1Select'gradients_1/Maximum_1_grad/GreaterEqual gradients_1/Maximum_1_grad/zeros-gradients_1/DynamicPartition_1_grad/Reshape_1*
T0
¦
 gradients_1/Maximum_1_grad/Sum_1Sum#gradients_1/Maximum_1_grad/Select_12gradients_1/Maximum_1_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0

$gradients_1/Maximum_1_grad/Reshape_1Reshape gradients_1/Maximum_1_grad/Sum_1"gradients_1/Maximum_1_grad/Shape_1*
T0*
Tshape0

+gradients_1/Maximum_1_grad/tuple/group_depsNoOp#^gradients_1/Maximum_1_grad/Reshape%^gradients_1/Maximum_1_grad/Reshape_1
Ń
3gradients_1/Maximum_1_grad/tuple/control_dependencyIdentity"gradients_1/Maximum_1_grad/Reshape,^gradients_1/Maximum_1_grad/tuple/group_deps*
T0*5
_class+
)'loc:@gradients_1/Maximum_1_grad/Reshape
×
5gradients_1/Maximum_1_grad/tuple/control_dependency_1Identity$gradients_1/Maximum_1_grad/Reshape_1,^gradients_1/Maximum_1_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients_1/Maximum_1_grad/Reshape_1
S
gradients_1/zeros_like_4	ZerosLike#softmax_cross_entropy_with_logits:1*
T0
t
Agradients_1/softmax_cross_entropy_with_logits_grad/ExpandDims/dimConst*
valueB :
’’’’’’’’’*
dtype0
é
=gradients_1/softmax_cross_entropy_with_logits_grad/ExpandDims
ExpandDimsDgradients_1/softmax_cross_entropy_with_logits/Reshape_2_grad/ReshapeAgradients_1/softmax_cross_entropy_with_logits_grad/ExpandDims/dim*

Tdim0*
T0
Ŗ
6gradients_1/softmax_cross_entropy_with_logits_grad/mulMul=gradients_1/softmax_cross_entropy_with_logits_grad/ExpandDims#softmax_cross_entropy_with_logits:1*
T0

=gradients_1/softmax_cross_entropy_with_logits_grad/LogSoftmax
LogSoftmax)softmax_cross_entropy_with_logits/Reshape*
T0

6gradients_1/softmax_cross_entropy_with_logits_grad/NegNeg=gradients_1/softmax_cross_entropy_with_logits_grad/LogSoftmax*
T0
v
Cgradients_1/softmax_cross_entropy_with_logits_grad/ExpandDims_1/dimConst*
valueB :
’’’’’’’’’*
dtype0
ķ
?gradients_1/softmax_cross_entropy_with_logits_grad/ExpandDims_1
ExpandDimsDgradients_1/softmax_cross_entropy_with_logits/Reshape_2_grad/ReshapeCgradients_1/softmax_cross_entropy_with_logits_grad/ExpandDims_1/dim*

Tdim0*
T0
Į
8gradients_1/softmax_cross_entropy_with_logits_grad/mul_1Mul?gradients_1/softmax_cross_entropy_with_logits_grad/ExpandDims_16gradients_1/softmax_cross_entropy_with_logits_grad/Neg*
T0
æ
Cgradients_1/softmax_cross_entropy_with_logits_grad/tuple/group_depsNoOp7^gradients_1/softmax_cross_entropy_with_logits_grad/mul9^gradients_1/softmax_cross_entropy_with_logits_grad/mul_1
©
Kgradients_1/softmax_cross_entropy_with_logits_grad/tuple/control_dependencyIdentity6gradients_1/softmax_cross_entropy_with_logits_grad/mulD^gradients_1/softmax_cross_entropy_with_logits_grad/tuple/group_deps*
T0*I
_class?
=;loc:@gradients_1/softmax_cross_entropy_with_logits_grad/mul
Æ
Mgradients_1/softmax_cross_entropy_with_logits_grad/tuple/control_dependency_1Identity8gradients_1/softmax_cross_entropy_with_logits_grad/mul_1D^gradients_1/softmax_cross_entropy_with_logits_grad/tuple/group_deps*
T0*K
_classA
?=loc:@gradients_1/softmax_cross_entropy_with_logits_grad/mul_1
U
.gradients_1/clip_by_value_2/Minimum_grad/ShapeShapeExp*
T0*
out_type0
Y
0gradients_1/clip_by_value_2/Minimum_grad/Shape_1Const*
valueB *
dtype0

0gradients_1/clip_by_value_2/Minimum_grad/Shape_2Shape9gradients_1/clip_by_value_2_grad/tuple/control_dependency*
T0*
out_type0
a
4gradients_1/clip_by_value_2/Minimum_grad/zeros/ConstConst*
valueB
 *    *
dtype0
¹
.gradients_1/clip_by_value_2/Minimum_grad/zerosFill0gradients_1/clip_by_value_2/Minimum_grad/Shape_24gradients_1/clip_by_value_2/Minimum_grad/zeros/Const*
T0*

index_type0
U
2gradients_1/clip_by_value_2/Minimum_grad/LessEqual	LessEqualExpadd_14*
T0
Ā
>gradients_1/clip_by_value_2/Minimum_grad/BroadcastGradientArgsBroadcastGradientArgs.gradients_1/clip_by_value_2/Minimum_grad/Shape0gradients_1/clip_by_value_2/Minimum_grad/Shape_1*
T0
į
/gradients_1/clip_by_value_2/Minimum_grad/SelectSelect2gradients_1/clip_by_value_2/Minimum_grad/LessEqual9gradients_1/clip_by_value_2_grad/tuple/control_dependency.gradients_1/clip_by_value_2/Minimum_grad/zeros*
T0
Ź
,gradients_1/clip_by_value_2/Minimum_grad/SumSum/gradients_1/clip_by_value_2/Minimum_grad/Select>gradients_1/clip_by_value_2/Minimum_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
°
0gradients_1/clip_by_value_2/Minimum_grad/ReshapeReshape,gradients_1/clip_by_value_2/Minimum_grad/Sum.gradients_1/clip_by_value_2/Minimum_grad/Shape*
T0*
Tshape0
ć
1gradients_1/clip_by_value_2/Minimum_grad/Select_1Select2gradients_1/clip_by_value_2/Minimum_grad/LessEqual.gradients_1/clip_by_value_2/Minimum_grad/zeros9gradients_1/clip_by_value_2_grad/tuple/control_dependency*
T0
Š
.gradients_1/clip_by_value_2/Minimum_grad/Sum_1Sum1gradients_1/clip_by_value_2/Minimum_grad/Select_1@gradients_1/clip_by_value_2/Minimum_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
¶
2gradients_1/clip_by_value_2/Minimum_grad/Reshape_1Reshape.gradients_1/clip_by_value_2/Minimum_grad/Sum_10gradients_1/clip_by_value_2/Minimum_grad/Shape_1*
T0*
Tshape0
©
9gradients_1/clip_by_value_2/Minimum_grad/tuple/group_depsNoOp1^gradients_1/clip_by_value_2/Minimum_grad/Reshape3^gradients_1/clip_by_value_2/Minimum_grad/Reshape_1

Agradients_1/clip_by_value_2/Minimum_grad/tuple/control_dependencyIdentity0gradients_1/clip_by_value_2/Minimum_grad/Reshape:^gradients_1/clip_by_value_2/Minimum_grad/tuple/group_deps*
T0*C
_class9
75loc:@gradients_1/clip_by_value_2/Minimum_grad/Reshape

Cgradients_1/clip_by_value_2/Minimum_grad/tuple/control_dependency_1Identity2gradients_1/clip_by_value_2/Minimum_grad/Reshape_1:^gradients_1/clip_by_value_2/Minimum_grad/tuple/group_deps*
T0*E
_class;
97loc:@gradients_1/clip_by_value_2/Minimum_grad/Reshape_1

)gradients_1/SquaredDifference_grad/scalarConst2^gradients_1/Maximum_grad/tuple/control_dependency*
valueB
 *   @*
dtype0

&gradients_1/SquaredDifference_grad/MulMul)gradients_1/SquaredDifference_grad/scalar1gradients_1/Maximum_grad/tuple/control_dependency*
T0

&gradients_1/SquaredDifference_grad/subSubextrinsic_returnsSum_62^gradients_1/Maximum_grad/tuple/control_dependency*
T0

(gradients_1/SquaredDifference_grad/mul_1Mul&gradients_1/SquaredDifference_grad/Mul&gradients_1/SquaredDifference_grad/sub*
T0
]
(gradients_1/SquaredDifference_grad/ShapeShapeextrinsic_returns*
T0*
out_type0
S
*gradients_1/SquaredDifference_grad/Shape_1ShapeSum_6*
T0*
out_type0
°
8gradients_1/SquaredDifference_grad/BroadcastGradientArgsBroadcastGradientArgs(gradients_1/SquaredDifference_grad/Shape*gradients_1/SquaredDifference_grad/Shape_1*
T0
·
&gradients_1/SquaredDifference_grad/SumSum(gradients_1/SquaredDifference_grad/mul_18gradients_1/SquaredDifference_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0

*gradients_1/SquaredDifference_grad/ReshapeReshape&gradients_1/SquaredDifference_grad/Sum(gradients_1/SquaredDifference_grad/Shape*
T0*
Tshape0
»
(gradients_1/SquaredDifference_grad/Sum_1Sum(gradients_1/SquaredDifference_grad/mul_1:gradients_1/SquaredDifference_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
¤
,gradients_1/SquaredDifference_grad/Reshape_1Reshape(gradients_1/SquaredDifference_grad/Sum_1*gradients_1/SquaredDifference_grad/Shape_1*
T0*
Tshape0
d
&gradients_1/SquaredDifference_grad/NegNeg,gradients_1/SquaredDifference_grad/Reshape_1*
T0

3gradients_1/SquaredDifference_grad/tuple/group_depsNoOp'^gradients_1/SquaredDifference_grad/Neg+^gradients_1/SquaredDifference_grad/Reshape
ń
;gradients_1/SquaredDifference_grad/tuple/control_dependencyIdentity*gradients_1/SquaredDifference_grad/Reshape4^gradients_1/SquaredDifference_grad/tuple/group_deps*
T0*=
_class3
1/loc:@gradients_1/SquaredDifference_grad/Reshape
ė
=gradients_1/SquaredDifference_grad/tuple/control_dependency_1Identity&gradients_1/SquaredDifference_grad/Neg4^gradients_1/SquaredDifference_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients_1/SquaredDifference_grad/Neg

+gradients_1/SquaredDifference_1_grad/scalarConst4^gradients_1/Maximum_grad/tuple/control_dependency_1*
valueB
 *   @*
dtype0

(gradients_1/SquaredDifference_1_grad/MulMul+gradients_1/SquaredDifference_1_grad/scalar3gradients_1/Maximum_grad/tuple/control_dependency_1*
T0

(gradients_1/SquaredDifference_1_grad/subSubextrinsic_returnsadd_124^gradients_1/Maximum_grad/tuple/control_dependency_1*
T0

*gradients_1/SquaredDifference_1_grad/mul_1Mul(gradients_1/SquaredDifference_1_grad/Mul(gradients_1/SquaredDifference_1_grad/sub*
T0
_
*gradients_1/SquaredDifference_1_grad/ShapeShapeextrinsic_returns*
T0*
out_type0
V
,gradients_1/SquaredDifference_1_grad/Shape_1Shapeadd_12*
T0*
out_type0
¶
:gradients_1/SquaredDifference_1_grad/BroadcastGradientArgsBroadcastGradientArgs*gradients_1/SquaredDifference_1_grad/Shape,gradients_1/SquaredDifference_1_grad/Shape_1*
T0
½
(gradients_1/SquaredDifference_1_grad/SumSum*gradients_1/SquaredDifference_1_grad/mul_1:gradients_1/SquaredDifference_1_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
¤
,gradients_1/SquaredDifference_1_grad/ReshapeReshape(gradients_1/SquaredDifference_1_grad/Sum*gradients_1/SquaredDifference_1_grad/Shape*
T0*
Tshape0
Į
*gradients_1/SquaredDifference_1_grad/Sum_1Sum*gradients_1/SquaredDifference_1_grad/mul_1<gradients_1/SquaredDifference_1_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
Ŗ
.gradients_1/SquaredDifference_1_grad/Reshape_1Reshape*gradients_1/SquaredDifference_1_grad/Sum_1,gradients_1/SquaredDifference_1_grad/Shape_1*
T0*
Tshape0
h
(gradients_1/SquaredDifference_1_grad/NegNeg.gradients_1/SquaredDifference_1_grad/Reshape_1*
T0

5gradients_1/SquaredDifference_1_grad/tuple/group_depsNoOp)^gradients_1/SquaredDifference_1_grad/Neg-^gradients_1/SquaredDifference_1_grad/Reshape
ł
=gradients_1/SquaredDifference_1_grad/tuple/control_dependencyIdentity,gradients_1/SquaredDifference_1_grad/Reshape6^gradients_1/SquaredDifference_1_grad/tuple/group_deps*
T0*?
_class5
31loc:@gradients_1/SquaredDifference_1_grad/Reshape
ó
?gradients_1/SquaredDifference_1_grad/tuple/control_dependency_1Identity(gradients_1/SquaredDifference_1_grad/Neg6^gradients_1/SquaredDifference_1_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients_1/SquaredDifference_1_grad/Neg

+gradients_1/SquaredDifference_2_grad/scalarConst4^gradients_1/Maximum_1_grad/tuple/control_dependency*
valueB
 *   @*
dtype0

(gradients_1/SquaredDifference_2_grad/MulMul+gradients_1/SquaredDifference_2_grad/scalar3gradients_1/Maximum_1_grad/tuple/control_dependency*
T0

(gradients_1/SquaredDifference_2_grad/subSubcuriosity_returnsSum_84^gradients_1/Maximum_1_grad/tuple/control_dependency*
T0

*gradients_1/SquaredDifference_2_grad/mul_1Mul(gradients_1/SquaredDifference_2_grad/Mul(gradients_1/SquaredDifference_2_grad/sub*
T0
_
*gradients_1/SquaredDifference_2_grad/ShapeShapecuriosity_returns*
T0*
out_type0
U
,gradients_1/SquaredDifference_2_grad/Shape_1ShapeSum_8*
T0*
out_type0
¶
:gradients_1/SquaredDifference_2_grad/BroadcastGradientArgsBroadcastGradientArgs*gradients_1/SquaredDifference_2_grad/Shape,gradients_1/SquaredDifference_2_grad/Shape_1*
T0
½
(gradients_1/SquaredDifference_2_grad/SumSum*gradients_1/SquaredDifference_2_grad/mul_1:gradients_1/SquaredDifference_2_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
¤
,gradients_1/SquaredDifference_2_grad/ReshapeReshape(gradients_1/SquaredDifference_2_grad/Sum*gradients_1/SquaredDifference_2_grad/Shape*
T0*
Tshape0
Į
*gradients_1/SquaredDifference_2_grad/Sum_1Sum*gradients_1/SquaredDifference_2_grad/mul_1<gradients_1/SquaredDifference_2_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
Ŗ
.gradients_1/SquaredDifference_2_grad/Reshape_1Reshape*gradients_1/SquaredDifference_2_grad/Sum_1,gradients_1/SquaredDifference_2_grad/Shape_1*
T0*
Tshape0
h
(gradients_1/SquaredDifference_2_grad/NegNeg.gradients_1/SquaredDifference_2_grad/Reshape_1*
T0

5gradients_1/SquaredDifference_2_grad/tuple/group_depsNoOp)^gradients_1/SquaredDifference_2_grad/Neg-^gradients_1/SquaredDifference_2_grad/Reshape
ł
=gradients_1/SquaredDifference_2_grad/tuple/control_dependencyIdentity,gradients_1/SquaredDifference_2_grad/Reshape6^gradients_1/SquaredDifference_2_grad/tuple/group_deps*
T0*?
_class5
31loc:@gradients_1/SquaredDifference_2_grad/Reshape
ó
?gradients_1/SquaredDifference_2_grad/tuple/control_dependency_1Identity(gradients_1/SquaredDifference_2_grad/Neg6^gradients_1/SquaredDifference_2_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients_1/SquaredDifference_2_grad/Neg

+gradients_1/SquaredDifference_3_grad/scalarConst6^gradients_1/Maximum_1_grad/tuple/control_dependency_1*
valueB
 *   @*
dtype0

(gradients_1/SquaredDifference_3_grad/MulMul+gradients_1/SquaredDifference_3_grad/scalar5gradients_1/Maximum_1_grad/tuple/control_dependency_1*
T0

(gradients_1/SquaredDifference_3_grad/subSubcuriosity_returnsadd_136^gradients_1/Maximum_1_grad/tuple/control_dependency_1*
T0

*gradients_1/SquaredDifference_3_grad/mul_1Mul(gradients_1/SquaredDifference_3_grad/Mul(gradients_1/SquaredDifference_3_grad/sub*
T0
_
*gradients_1/SquaredDifference_3_grad/ShapeShapecuriosity_returns*
T0*
out_type0
V
,gradients_1/SquaredDifference_3_grad/Shape_1Shapeadd_13*
T0*
out_type0
¶
:gradients_1/SquaredDifference_3_grad/BroadcastGradientArgsBroadcastGradientArgs*gradients_1/SquaredDifference_3_grad/Shape,gradients_1/SquaredDifference_3_grad/Shape_1*
T0
½
(gradients_1/SquaredDifference_3_grad/SumSum*gradients_1/SquaredDifference_3_grad/mul_1:gradients_1/SquaredDifference_3_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
¤
,gradients_1/SquaredDifference_3_grad/ReshapeReshape(gradients_1/SquaredDifference_3_grad/Sum*gradients_1/SquaredDifference_3_grad/Shape*
T0*
Tshape0
Į
*gradients_1/SquaredDifference_3_grad/Sum_1Sum*gradients_1/SquaredDifference_3_grad/mul_1<gradients_1/SquaredDifference_3_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
Ŗ
.gradients_1/SquaredDifference_3_grad/Reshape_1Reshape*gradients_1/SquaredDifference_3_grad/Sum_1,gradients_1/SquaredDifference_3_grad/Shape_1*
T0*
Tshape0
h
(gradients_1/SquaredDifference_3_grad/NegNeg.gradients_1/SquaredDifference_3_grad/Reshape_1*
T0

5gradients_1/SquaredDifference_3_grad/tuple/group_depsNoOp)^gradients_1/SquaredDifference_3_grad/Neg-^gradients_1/SquaredDifference_3_grad/Reshape
ł
=gradients_1/SquaredDifference_3_grad/tuple/control_dependencyIdentity,gradients_1/SquaredDifference_3_grad/Reshape6^gradients_1/SquaredDifference_3_grad/tuple/group_deps*
T0*?
_class5
31loc:@gradients_1/SquaredDifference_3_grad/Reshape
ó
?gradients_1/SquaredDifference_3_grad/tuple/control_dependency_1Identity(gradients_1/SquaredDifference_3_grad/Neg6^gradients_1/SquaredDifference_3_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients_1/SquaredDifference_3_grad/Neg
s
@gradients_1/softmax_cross_entropy_with_logits/Reshape_grad/ShapeShapestrided_slice_6*
T0*
out_type0
ó
Bgradients_1/softmax_cross_entropy_with_logits/Reshape_grad/ReshapeReshapeKgradients_1/softmax_cross_entropy_with_logits_grad/tuple/control_dependency@gradients_1/softmax_cross_entropy_with_logits/Reshape_grad/Shape*
T0*
Tshape0
o
Bgradients_1/softmax_cross_entropy_with_logits/Reshape_1_grad/ShapeShape	Softmax_2*
T0*
out_type0
ł
Dgradients_1/softmax_cross_entropy_with_logits/Reshape_1_grad/ReshapeReshapeMgradients_1/softmax_cross_entropy_with_logits_grad/tuple/control_dependency_1Bgradients_1/softmax_cross_entropy_with_logits/Reshape_1_grad/Shape*
T0*
Tshape0
Ń
gradients_1/AddNAddN/gradients_1/mul_3_grad/tuple/control_dependencyAgradients_1/clip_by_value_2/Minimum_grad/tuple/control_dependency*
T0*1
_class'
%#loc:@gradients_1/mul_3_grad/Reshape*
N
?
gradients_1/Exp_grad/mulMulgradients_1/AddNExp*
T0
W
gradients_1/Sum_6_grad/ShapeShapeextrinsic_value/BiasAdd*
T0*
out_type0
v
gradients_1/Sum_6_grad/SizeConst*/
_class%
#!loc:@gradients_1/Sum_6_grad/Shape*
value	B :*
dtype0

gradients_1/Sum_6_grad/addAddV2Sum_6/reduction_indicesgradients_1/Sum_6_grad/Size*
T0*/
_class%
#!loc:@gradients_1/Sum_6_grad/Shape

gradients_1/Sum_6_grad/modFloorModgradients_1/Sum_6_grad/addgradients_1/Sum_6_grad/Size*
T0*/
_class%
#!loc:@gradients_1/Sum_6_grad/Shape
x
gradients_1/Sum_6_grad/Shape_1Const*/
_class%
#!loc:@gradients_1/Sum_6_grad/Shape*
valueB *
dtype0
}
"gradients_1/Sum_6_grad/range/startConst*/
_class%
#!loc:@gradients_1/Sum_6_grad/Shape*
value	B : *
dtype0
}
"gradients_1/Sum_6_grad/range/deltaConst*/
_class%
#!loc:@gradients_1/Sum_6_grad/Shape*
value	B :*
dtype0
Ē
gradients_1/Sum_6_grad/rangeRange"gradients_1/Sum_6_grad/range/startgradients_1/Sum_6_grad/Size"gradients_1/Sum_6_grad/range/delta*

Tidx0*/
_class%
#!loc:@gradients_1/Sum_6_grad/Shape
|
!gradients_1/Sum_6_grad/Fill/valueConst*/
_class%
#!loc:@gradients_1/Sum_6_grad/Shape*
value	B :*
dtype0
²
gradients_1/Sum_6_grad/FillFillgradients_1/Sum_6_grad/Shape_1!gradients_1/Sum_6_grad/Fill/value*
T0*/
_class%
#!loc:@gradients_1/Sum_6_grad/Shape*

index_type0
ķ
$gradients_1/Sum_6_grad/DynamicStitchDynamicStitchgradients_1/Sum_6_grad/rangegradients_1/Sum_6_grad/modgradients_1/Sum_6_grad/Shapegradients_1/Sum_6_grad/Fill*
T0*/
_class%
#!loc:@gradients_1/Sum_6_grad/Shape*
N
{
 gradients_1/Sum_6_grad/Maximum/yConst*/
_class%
#!loc:@gradients_1/Sum_6_grad/Shape*
value	B :*
dtype0
«
gradients_1/Sum_6_grad/MaximumMaximum$gradients_1/Sum_6_grad/DynamicStitch gradients_1/Sum_6_grad/Maximum/y*
T0*/
_class%
#!loc:@gradients_1/Sum_6_grad/Shape
£
gradients_1/Sum_6_grad/floordivFloorDivgradients_1/Sum_6_grad/Shapegradients_1/Sum_6_grad/Maximum*
T0*/
_class%
#!loc:@gradients_1/Sum_6_grad/Shape
„
gradients_1/Sum_6_grad/ReshapeReshape=gradients_1/SquaredDifference_grad/tuple/control_dependency_1$gradients_1/Sum_6_grad/DynamicStitch*
T0*
Tshape0

gradients_1/Sum_6_grad/TileTilegradients_1/Sum_6_grad/Reshapegradients_1/Sum_6_grad/floordiv*

Tmultiples0*
T0
Y
gradients_1/add_12_grad/ShapeShapeextrinsic_value_estimate*
T0*
out_type0
P
gradients_1/add_12_grad/Shape_1Shapeclip_by_value*
T0*
out_type0

-gradients_1/add_12_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/add_12_grad/Shapegradients_1/add_12_grad/Shape_1*
T0
ø
gradients_1/add_12_grad/SumSum?gradients_1/SquaredDifference_1_grad/tuple/control_dependency_1-gradients_1/add_12_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
}
gradients_1/add_12_grad/ReshapeReshapegradients_1/add_12_grad/Sumgradients_1/add_12_grad/Shape*
T0*
Tshape0
¼
gradients_1/add_12_grad/Sum_1Sum?gradients_1/SquaredDifference_1_grad/tuple/control_dependency_1/gradients_1/add_12_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0

!gradients_1/add_12_grad/Reshape_1Reshapegradients_1/add_12_grad/Sum_1gradients_1/add_12_grad/Shape_1*
T0*
Tshape0
v
(gradients_1/add_12_grad/tuple/group_depsNoOp ^gradients_1/add_12_grad/Reshape"^gradients_1/add_12_grad/Reshape_1
Å
0gradients_1/add_12_grad/tuple/control_dependencyIdentitygradients_1/add_12_grad/Reshape)^gradients_1/add_12_grad/tuple/group_deps*
T0*2
_class(
&$loc:@gradients_1/add_12_grad/Reshape
Ė
2gradients_1/add_12_grad/tuple/control_dependency_1Identity!gradients_1/add_12_grad/Reshape_1)^gradients_1/add_12_grad/tuple/group_deps*
T0*4
_class*
(&loc:@gradients_1/add_12_grad/Reshape_1
W
gradients_1/Sum_8_grad/ShapeShapecuriosity_value/BiasAdd*
T0*
out_type0
v
gradients_1/Sum_8_grad/SizeConst*/
_class%
#!loc:@gradients_1/Sum_8_grad/Shape*
value	B :*
dtype0

gradients_1/Sum_8_grad/addAddV2Sum_8/reduction_indicesgradients_1/Sum_8_grad/Size*
T0*/
_class%
#!loc:@gradients_1/Sum_8_grad/Shape

gradients_1/Sum_8_grad/modFloorModgradients_1/Sum_8_grad/addgradients_1/Sum_8_grad/Size*
T0*/
_class%
#!loc:@gradients_1/Sum_8_grad/Shape
x
gradients_1/Sum_8_grad/Shape_1Const*/
_class%
#!loc:@gradients_1/Sum_8_grad/Shape*
valueB *
dtype0
}
"gradients_1/Sum_8_grad/range/startConst*/
_class%
#!loc:@gradients_1/Sum_8_grad/Shape*
value	B : *
dtype0
}
"gradients_1/Sum_8_grad/range/deltaConst*/
_class%
#!loc:@gradients_1/Sum_8_grad/Shape*
value	B :*
dtype0
Ē
gradients_1/Sum_8_grad/rangeRange"gradients_1/Sum_8_grad/range/startgradients_1/Sum_8_grad/Size"gradients_1/Sum_8_grad/range/delta*

Tidx0*/
_class%
#!loc:@gradients_1/Sum_8_grad/Shape
|
!gradients_1/Sum_8_grad/Fill/valueConst*/
_class%
#!loc:@gradients_1/Sum_8_grad/Shape*
value	B :*
dtype0
²
gradients_1/Sum_8_grad/FillFillgradients_1/Sum_8_grad/Shape_1!gradients_1/Sum_8_grad/Fill/value*
T0*/
_class%
#!loc:@gradients_1/Sum_8_grad/Shape*

index_type0
ķ
$gradients_1/Sum_8_grad/DynamicStitchDynamicStitchgradients_1/Sum_8_grad/rangegradients_1/Sum_8_grad/modgradients_1/Sum_8_grad/Shapegradients_1/Sum_8_grad/Fill*
T0*/
_class%
#!loc:@gradients_1/Sum_8_grad/Shape*
N
{
 gradients_1/Sum_8_grad/Maximum/yConst*/
_class%
#!loc:@gradients_1/Sum_8_grad/Shape*
value	B :*
dtype0
«
gradients_1/Sum_8_grad/MaximumMaximum$gradients_1/Sum_8_grad/DynamicStitch gradients_1/Sum_8_grad/Maximum/y*
T0*/
_class%
#!loc:@gradients_1/Sum_8_grad/Shape
£
gradients_1/Sum_8_grad/floordivFloorDivgradients_1/Sum_8_grad/Shapegradients_1/Sum_8_grad/Maximum*
T0*/
_class%
#!loc:@gradients_1/Sum_8_grad/Shape
§
gradients_1/Sum_8_grad/ReshapeReshape?gradients_1/SquaredDifference_2_grad/tuple/control_dependency_1$gradients_1/Sum_8_grad/DynamicStitch*
T0*
Tshape0

gradients_1/Sum_8_grad/TileTilegradients_1/Sum_8_grad/Reshapegradients_1/Sum_8_grad/floordiv*

Tmultiples0*
T0
Y
gradients_1/add_13_grad/ShapeShapecuriosity_value_estimate*
T0*
out_type0
R
gradients_1/add_13_grad/Shape_1Shapeclip_by_value_1*
T0*
out_type0

-gradients_1/add_13_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/add_13_grad/Shapegradients_1/add_13_grad/Shape_1*
T0
ø
gradients_1/add_13_grad/SumSum?gradients_1/SquaredDifference_3_grad/tuple/control_dependency_1-gradients_1/add_13_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
}
gradients_1/add_13_grad/ReshapeReshapegradients_1/add_13_grad/Sumgradients_1/add_13_grad/Shape*
T0*
Tshape0
¼
gradients_1/add_13_grad/Sum_1Sum?gradients_1/SquaredDifference_3_grad/tuple/control_dependency_1/gradients_1/add_13_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0

!gradients_1/add_13_grad/Reshape_1Reshapegradients_1/add_13_grad/Sum_1gradients_1/add_13_grad/Shape_1*
T0*
Tshape0
v
(gradients_1/add_13_grad/tuple/group_depsNoOp ^gradients_1/add_13_grad/Reshape"^gradients_1/add_13_grad/Reshape_1
Å
0gradients_1/add_13_grad/tuple/control_dependencyIdentitygradients_1/add_13_grad/Reshape)^gradients_1/add_13_grad/tuple/group_deps*
T0*2
_class(
&$loc:@gradients_1/add_13_grad/Reshape
Ė
2gradients_1/add_13_grad/tuple/control_dependency_1Identity!gradients_1/add_13_grad/Reshape_1)^gradients_1/add_13_grad/tuple/group_deps*
T0*4
_class*
(&loc:@gradients_1/add_13_grad/Reshape_1
c
&gradients_1/strided_slice_6_grad/ShapeShapeaction_probs/action_probs*
T0*
out_type0
ō
1gradients_1/strided_slice_6_grad/StridedSliceGradStridedSliceGrad&gradients_1/strided_slice_6_grad/Shapestrided_slice_6/stackstrided_slice_6/stack_1strided_slice_6/stack_2Bgradients_1/softmax_cross_entropy_with_logits/Reshape_grad/Reshape*
Index0*
T0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask

gradients_1/Softmax_2_grad/mulMulDgradients_1/softmax_cross_entropy_with_logits/Reshape_1_grad/Reshape	Softmax_2*
T0
c
0gradients_1/Softmax_2_grad/Sum/reduction_indicesConst*
valueB :
’’’’’’’’’*
dtype0

gradients_1/Softmax_2_grad/SumSumgradients_1/Softmax_2_grad/mul0gradients_1/Softmax_2_grad/Sum/reduction_indices*

Tidx0*
	keep_dims(*
T0

gradients_1/Softmax_2_grad/subSubDgradients_1/softmax_cross_entropy_with_logits/Reshape_1_grad/Reshapegradients_1/Softmax_2_grad/Sum*
T0
[
 gradients_1/Softmax_2_grad/mul_1Mulgradients_1/Softmax_2_grad/sub	Softmax_2*
T0
E
gradients_1/sub_6_grad/ShapeShapeSum_3*
T0*
out_type0
G
gradients_1/sub_6_grad/Shape_1ShapeSum_4*
T0*
out_type0

,gradients_1/sub_6_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/sub_6_grad/Shapegradients_1/sub_6_grad/Shape_1*
T0

gradients_1/sub_6_grad/SumSumgradients_1/Exp_grad/mul,gradients_1/sub_6_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
z
gradients_1/sub_6_grad/ReshapeReshapegradients_1/sub_6_grad/Sumgradients_1/sub_6_grad/Shape*
T0*
Tshape0
D
gradients_1/sub_6_grad/NegNeggradients_1/Exp_grad/mul*
T0

gradients_1/sub_6_grad/Sum_1Sumgradients_1/sub_6_grad/Neg.gradients_1/sub_6_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0

 gradients_1/sub_6_grad/Reshape_1Reshapegradients_1/sub_6_grad/Sum_1gradients_1/sub_6_grad/Shape_1*
T0*
Tshape0
s
'gradients_1/sub_6_grad/tuple/group_depsNoOp^gradients_1/sub_6_grad/Reshape!^gradients_1/sub_6_grad/Reshape_1
Į
/gradients_1/sub_6_grad/tuple/control_dependencyIdentitygradients_1/sub_6_grad/Reshape(^gradients_1/sub_6_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_1/sub_6_grad/Reshape
Ē
1gradients_1/sub_6_grad/tuple/control_dependency_1Identity gradients_1/sub_6_grad/Reshape_1(^gradients_1/sub_6_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_1/sub_6_grad/Reshape_1
]
$gradients_1/clip_by_value_grad/ShapeShapeclip_by_value/Minimum*
T0*
out_type0
O
&gradients_1/clip_by_value_grad/Shape_1Const*
valueB *
dtype0
|
&gradients_1/clip_by_value_grad/Shape_2Shape2gradients_1/add_12_grad/tuple/control_dependency_1*
T0*
out_type0
W
*gradients_1/clip_by_value_grad/zeros/ConstConst*
valueB
 *    *
dtype0

$gradients_1/clip_by_value_grad/zerosFill&gradients_1/clip_by_value_grad/Shape_2*gradients_1/clip_by_value_grad/zeros/Const*
T0*

index_type0
b
+gradients_1/clip_by_value_grad/GreaterEqualGreaterEqualclip_by_value/MinimumNeg_2*
T0
¤
4gradients_1/clip_by_value_grad/BroadcastGradientArgsBroadcastGradientArgs$gradients_1/clip_by_value_grad/Shape&gradients_1/clip_by_value_grad/Shape_1*
T0
æ
%gradients_1/clip_by_value_grad/SelectSelect+gradients_1/clip_by_value_grad/GreaterEqual2gradients_1/add_12_grad/tuple/control_dependency_1$gradients_1/clip_by_value_grad/zeros*
T0
¬
"gradients_1/clip_by_value_grad/SumSum%gradients_1/clip_by_value_grad/Select4gradients_1/clip_by_value_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0

&gradients_1/clip_by_value_grad/ReshapeReshape"gradients_1/clip_by_value_grad/Sum$gradients_1/clip_by_value_grad/Shape*
T0*
Tshape0
Į
'gradients_1/clip_by_value_grad/Select_1Select+gradients_1/clip_by_value_grad/GreaterEqual$gradients_1/clip_by_value_grad/zeros2gradients_1/add_12_grad/tuple/control_dependency_1*
T0
²
$gradients_1/clip_by_value_grad/Sum_1Sum'gradients_1/clip_by_value_grad/Select_16gradients_1/clip_by_value_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0

(gradients_1/clip_by_value_grad/Reshape_1Reshape$gradients_1/clip_by_value_grad/Sum_1&gradients_1/clip_by_value_grad/Shape_1*
T0*
Tshape0

/gradients_1/clip_by_value_grad/tuple/group_depsNoOp'^gradients_1/clip_by_value_grad/Reshape)^gradients_1/clip_by_value_grad/Reshape_1
į
7gradients_1/clip_by_value_grad/tuple/control_dependencyIdentity&gradients_1/clip_by_value_grad/Reshape0^gradients_1/clip_by_value_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients_1/clip_by_value_grad/Reshape
ē
9gradients_1/clip_by_value_grad/tuple/control_dependency_1Identity(gradients_1/clip_by_value_grad/Reshape_10^gradients_1/clip_by_value_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients_1/clip_by_value_grad/Reshape_1
a
&gradients_1/clip_by_value_1_grad/ShapeShapeclip_by_value_1/Minimum*
T0*
out_type0
Q
(gradients_1/clip_by_value_1_grad/Shape_1Const*
valueB *
dtype0
~
(gradients_1/clip_by_value_1_grad/Shape_2Shape2gradients_1/add_13_grad/tuple/control_dependency_1*
T0*
out_type0
Y
,gradients_1/clip_by_value_1_grad/zeros/ConstConst*
valueB
 *    *
dtype0
”
&gradients_1/clip_by_value_1_grad/zerosFill(gradients_1/clip_by_value_1_grad/Shape_2,gradients_1/clip_by_value_1_grad/zeros/Const*
T0*

index_type0
f
-gradients_1/clip_by_value_1_grad/GreaterEqualGreaterEqualclip_by_value_1/MinimumNeg_3*
T0
Ŗ
6gradients_1/clip_by_value_1_grad/BroadcastGradientArgsBroadcastGradientArgs&gradients_1/clip_by_value_1_grad/Shape(gradients_1/clip_by_value_1_grad/Shape_1*
T0
Å
'gradients_1/clip_by_value_1_grad/SelectSelect-gradients_1/clip_by_value_1_grad/GreaterEqual2gradients_1/add_13_grad/tuple/control_dependency_1&gradients_1/clip_by_value_1_grad/zeros*
T0
²
$gradients_1/clip_by_value_1_grad/SumSum'gradients_1/clip_by_value_1_grad/Select6gradients_1/clip_by_value_1_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0

(gradients_1/clip_by_value_1_grad/ReshapeReshape$gradients_1/clip_by_value_1_grad/Sum&gradients_1/clip_by_value_1_grad/Shape*
T0*
Tshape0
Ē
)gradients_1/clip_by_value_1_grad/Select_1Select-gradients_1/clip_by_value_1_grad/GreaterEqual&gradients_1/clip_by_value_1_grad/zeros2gradients_1/add_13_grad/tuple/control_dependency_1*
T0
ø
&gradients_1/clip_by_value_1_grad/Sum_1Sum)gradients_1/clip_by_value_1_grad/Select_18gradients_1/clip_by_value_1_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0

*gradients_1/clip_by_value_1_grad/Reshape_1Reshape&gradients_1/clip_by_value_1_grad/Sum_1(gradients_1/clip_by_value_1_grad/Shape_1*
T0*
Tshape0

1gradients_1/clip_by_value_1_grad/tuple/group_depsNoOp)^gradients_1/clip_by_value_1_grad/Reshape+^gradients_1/clip_by_value_1_grad/Reshape_1
é
9gradients_1/clip_by_value_1_grad/tuple/control_dependencyIdentity(gradients_1/clip_by_value_1_grad/Reshape2^gradients_1/clip_by_value_1_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients_1/clip_by_value_1_grad/Reshape
ļ
;gradients_1/clip_by_value_1_grad/tuple/control_dependency_1Identity*gradients_1/clip_by_value_1_grad/Reshape_12^gradients_1/clip_by_value_1_grad/tuple/group_deps*
T0*=
_class3
1/loc:@gradients_1/clip_by_value_1_grad/Reshape_1
c
&gradients_1/strided_slice_5_grad/ShapeShapeaction_probs/action_probs*
T0*
out_type0
Ņ
1gradients_1/strided_slice_5_grad/StridedSliceGradStridedSliceGrad&gradients_1/strided_slice_5_grad/Shapestrided_slice_5/stackstrided_slice_5/stack_1strided_slice_5/stack_2 gradients_1/Softmax_2_grad/mul_1*
Index0*
T0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
G
gradients_1/Sum_3_grad/ShapeShapestack_1*
T0*
out_type0
v
gradients_1/Sum_3_grad/SizeConst*/
_class%
#!loc:@gradients_1/Sum_3_grad/Shape*
value	B :*
dtype0

gradients_1/Sum_3_grad/addAddV2Sum_3/reduction_indicesgradients_1/Sum_3_grad/Size*
T0*/
_class%
#!loc:@gradients_1/Sum_3_grad/Shape

gradients_1/Sum_3_grad/modFloorModgradients_1/Sum_3_grad/addgradients_1/Sum_3_grad/Size*
T0*/
_class%
#!loc:@gradients_1/Sum_3_grad/Shape
x
gradients_1/Sum_3_grad/Shape_1Const*/
_class%
#!loc:@gradients_1/Sum_3_grad/Shape*
valueB *
dtype0
}
"gradients_1/Sum_3_grad/range/startConst*/
_class%
#!loc:@gradients_1/Sum_3_grad/Shape*
value	B : *
dtype0
}
"gradients_1/Sum_3_grad/range/deltaConst*/
_class%
#!loc:@gradients_1/Sum_3_grad/Shape*
value	B :*
dtype0
Ē
gradients_1/Sum_3_grad/rangeRange"gradients_1/Sum_3_grad/range/startgradients_1/Sum_3_grad/Size"gradients_1/Sum_3_grad/range/delta*

Tidx0*/
_class%
#!loc:@gradients_1/Sum_3_grad/Shape
|
!gradients_1/Sum_3_grad/Fill/valueConst*/
_class%
#!loc:@gradients_1/Sum_3_grad/Shape*
value	B :*
dtype0
²
gradients_1/Sum_3_grad/FillFillgradients_1/Sum_3_grad/Shape_1!gradients_1/Sum_3_grad/Fill/value*
T0*/
_class%
#!loc:@gradients_1/Sum_3_grad/Shape*

index_type0
ķ
$gradients_1/Sum_3_grad/DynamicStitchDynamicStitchgradients_1/Sum_3_grad/rangegradients_1/Sum_3_grad/modgradients_1/Sum_3_grad/Shapegradients_1/Sum_3_grad/Fill*
T0*/
_class%
#!loc:@gradients_1/Sum_3_grad/Shape*
N
{
 gradients_1/Sum_3_grad/Maximum/yConst*/
_class%
#!loc:@gradients_1/Sum_3_grad/Shape*
value	B :*
dtype0
«
gradients_1/Sum_3_grad/MaximumMaximum$gradients_1/Sum_3_grad/DynamicStitch gradients_1/Sum_3_grad/Maximum/y*
T0*/
_class%
#!loc:@gradients_1/Sum_3_grad/Shape
£
gradients_1/Sum_3_grad/floordivFloorDivgradients_1/Sum_3_grad/Shapegradients_1/Sum_3_grad/Maximum*
T0*/
_class%
#!loc:@gradients_1/Sum_3_grad/Shape

gradients_1/Sum_3_grad/ReshapeReshape/gradients_1/sub_6_grad/tuple/control_dependency$gradients_1/Sum_3_grad/DynamicStitch*
T0*
Tshape0

gradients_1/Sum_3_grad/TileTilegradients_1/Sum_3_grad/Reshapegradients_1/Sum_3_grad/floordiv*

Tmultiples0*
T0
U
,gradients_1/clip_by_value/Minimum_grad/ShapeShapesub_4*
T0*
out_type0
W
.gradients_1/clip_by_value/Minimum_grad/Shape_1Const*
valueB *
dtype0

.gradients_1/clip_by_value/Minimum_grad/Shape_2Shape7gradients_1/clip_by_value_grad/tuple/control_dependency*
T0*
out_type0
_
2gradients_1/clip_by_value/Minimum_grad/zeros/ConstConst*
valueB
 *    *
dtype0
³
,gradients_1/clip_by_value/Minimum_grad/zerosFill.gradients_1/clip_by_value/Minimum_grad/Shape_22gradients_1/clip_by_value/Minimum_grad/zeros/Const*
T0*

index_type0
`
0gradients_1/clip_by_value/Minimum_grad/LessEqual	LessEqualsub_4PolynomialDecay_1*
T0
¼
<gradients_1/clip_by_value/Minimum_grad/BroadcastGradientArgsBroadcastGradientArgs,gradients_1/clip_by_value/Minimum_grad/Shape.gradients_1/clip_by_value/Minimum_grad/Shape_1*
T0
Ł
-gradients_1/clip_by_value/Minimum_grad/SelectSelect0gradients_1/clip_by_value/Minimum_grad/LessEqual7gradients_1/clip_by_value_grad/tuple/control_dependency,gradients_1/clip_by_value/Minimum_grad/zeros*
T0
Ä
*gradients_1/clip_by_value/Minimum_grad/SumSum-gradients_1/clip_by_value/Minimum_grad/Select<gradients_1/clip_by_value/Minimum_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
Ŗ
.gradients_1/clip_by_value/Minimum_grad/ReshapeReshape*gradients_1/clip_by_value/Minimum_grad/Sum,gradients_1/clip_by_value/Minimum_grad/Shape*
T0*
Tshape0
Ū
/gradients_1/clip_by_value/Minimum_grad/Select_1Select0gradients_1/clip_by_value/Minimum_grad/LessEqual,gradients_1/clip_by_value/Minimum_grad/zeros7gradients_1/clip_by_value_grad/tuple/control_dependency*
T0
Ź
,gradients_1/clip_by_value/Minimum_grad/Sum_1Sum/gradients_1/clip_by_value/Minimum_grad/Select_1>gradients_1/clip_by_value/Minimum_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
°
0gradients_1/clip_by_value/Minimum_grad/Reshape_1Reshape,gradients_1/clip_by_value/Minimum_grad/Sum_1.gradients_1/clip_by_value/Minimum_grad/Shape_1*
T0*
Tshape0
£
7gradients_1/clip_by_value/Minimum_grad/tuple/group_depsNoOp/^gradients_1/clip_by_value/Minimum_grad/Reshape1^gradients_1/clip_by_value/Minimum_grad/Reshape_1

?gradients_1/clip_by_value/Minimum_grad/tuple/control_dependencyIdentity.gradients_1/clip_by_value/Minimum_grad/Reshape8^gradients_1/clip_by_value/Minimum_grad/tuple/group_deps*
T0*A
_class7
53loc:@gradients_1/clip_by_value/Minimum_grad/Reshape

Agradients_1/clip_by_value/Minimum_grad/tuple/control_dependency_1Identity0gradients_1/clip_by_value/Minimum_grad/Reshape_18^gradients_1/clip_by_value/Minimum_grad/tuple/group_deps*
T0*C
_class9
75loc:@gradients_1/clip_by_value/Minimum_grad/Reshape_1
W
.gradients_1/clip_by_value_1/Minimum_grad/ShapeShapesub_5*
T0*
out_type0
Y
0gradients_1/clip_by_value_1/Minimum_grad/Shape_1Const*
valueB *
dtype0

0gradients_1/clip_by_value_1/Minimum_grad/Shape_2Shape9gradients_1/clip_by_value_1_grad/tuple/control_dependency*
T0*
out_type0
a
4gradients_1/clip_by_value_1/Minimum_grad/zeros/ConstConst*
valueB
 *    *
dtype0
¹
.gradients_1/clip_by_value_1/Minimum_grad/zerosFill0gradients_1/clip_by_value_1/Minimum_grad/Shape_24gradients_1/clip_by_value_1/Minimum_grad/zeros/Const*
T0*

index_type0
b
2gradients_1/clip_by_value_1/Minimum_grad/LessEqual	LessEqualsub_5PolynomialDecay_1*
T0
Ā
>gradients_1/clip_by_value_1/Minimum_grad/BroadcastGradientArgsBroadcastGradientArgs.gradients_1/clip_by_value_1/Minimum_grad/Shape0gradients_1/clip_by_value_1/Minimum_grad/Shape_1*
T0
į
/gradients_1/clip_by_value_1/Minimum_grad/SelectSelect2gradients_1/clip_by_value_1/Minimum_grad/LessEqual9gradients_1/clip_by_value_1_grad/tuple/control_dependency.gradients_1/clip_by_value_1/Minimum_grad/zeros*
T0
Ź
,gradients_1/clip_by_value_1/Minimum_grad/SumSum/gradients_1/clip_by_value_1/Minimum_grad/Select>gradients_1/clip_by_value_1/Minimum_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
°
0gradients_1/clip_by_value_1/Minimum_grad/ReshapeReshape,gradients_1/clip_by_value_1/Minimum_grad/Sum.gradients_1/clip_by_value_1/Minimum_grad/Shape*
T0*
Tshape0
ć
1gradients_1/clip_by_value_1/Minimum_grad/Select_1Select2gradients_1/clip_by_value_1/Minimum_grad/LessEqual.gradients_1/clip_by_value_1/Minimum_grad/zeros9gradients_1/clip_by_value_1_grad/tuple/control_dependency*
T0
Š
.gradients_1/clip_by_value_1/Minimum_grad/Sum_1Sum1gradients_1/clip_by_value_1/Minimum_grad/Select_1@gradients_1/clip_by_value_1/Minimum_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
¶
2gradients_1/clip_by_value_1/Minimum_grad/Reshape_1Reshape.gradients_1/clip_by_value_1/Minimum_grad/Sum_10gradients_1/clip_by_value_1/Minimum_grad/Shape_1*
T0*
Tshape0
©
9gradients_1/clip_by_value_1/Minimum_grad/tuple/group_depsNoOp1^gradients_1/clip_by_value_1/Minimum_grad/Reshape3^gradients_1/clip_by_value_1/Minimum_grad/Reshape_1

Agradients_1/clip_by_value_1/Minimum_grad/tuple/control_dependencyIdentity0gradients_1/clip_by_value_1/Minimum_grad/Reshape:^gradients_1/clip_by_value_1/Minimum_grad/tuple/group_deps*
T0*C
_class9
75loc:@gradients_1/clip_by_value_1/Minimum_grad/Reshape

Cgradients_1/clip_by_value_1/Minimum_grad/tuple/control_dependency_1Identity2gradients_1/clip_by_value_1/Minimum_grad/Reshape_1:^gradients_1/clip_by_value_1/Minimum_grad/tuple/group_deps*
T0*E
_class;
97loc:@gradients_1/clip_by_value_1/Minimum_grad/Reshape_1
g
 gradients_1/stack_1_grad/unstackUnpackgradients_1/Sum_3_grad/Tile*
T0*	
num*

axis
E
gradients_1/sub_4_grad/ShapeShapeSum_5*
T0*
out_type0
Z
gradients_1/sub_4_grad/Shape_1Shapeextrinsic_value_estimate*
T0*
out_type0

,gradients_1/sub_4_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/sub_4_grad/Shapegradients_1/sub_4_grad/Shape_1*
T0
¶
gradients_1/sub_4_grad/SumSum?gradients_1/clip_by_value/Minimum_grad/tuple/control_dependency,gradients_1/sub_4_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
z
gradients_1/sub_4_grad/ReshapeReshapegradients_1/sub_4_grad/Sumgradients_1/sub_4_grad/Shape*
T0*
Tshape0
k
gradients_1/sub_4_grad/NegNeg?gradients_1/clip_by_value/Minimum_grad/tuple/control_dependency*
T0

gradients_1/sub_4_grad/Sum_1Sumgradients_1/sub_4_grad/Neg.gradients_1/sub_4_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0

 gradients_1/sub_4_grad/Reshape_1Reshapegradients_1/sub_4_grad/Sum_1gradients_1/sub_4_grad/Shape_1*
T0*
Tshape0
s
'gradients_1/sub_4_grad/tuple/group_depsNoOp^gradients_1/sub_4_grad/Reshape!^gradients_1/sub_4_grad/Reshape_1
Į
/gradients_1/sub_4_grad/tuple/control_dependencyIdentitygradients_1/sub_4_grad/Reshape(^gradients_1/sub_4_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_1/sub_4_grad/Reshape
Ē
1gradients_1/sub_4_grad/tuple/control_dependency_1Identity gradients_1/sub_4_grad/Reshape_1(^gradients_1/sub_4_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_1/sub_4_grad/Reshape_1
E
gradients_1/sub_5_grad/ShapeShapeSum_7*
T0*
out_type0
Z
gradients_1/sub_5_grad/Shape_1Shapecuriosity_value_estimate*
T0*
out_type0

,gradients_1/sub_5_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/sub_5_grad/Shapegradients_1/sub_5_grad/Shape_1*
T0
ø
gradients_1/sub_5_grad/SumSumAgradients_1/clip_by_value_1/Minimum_grad/tuple/control_dependency,gradients_1/sub_5_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
z
gradients_1/sub_5_grad/ReshapeReshapegradients_1/sub_5_grad/Sumgradients_1/sub_5_grad/Shape*
T0*
Tshape0
m
gradients_1/sub_5_grad/NegNegAgradients_1/clip_by_value_1/Minimum_grad/tuple/control_dependency*
T0

gradients_1/sub_5_grad/Sum_1Sumgradients_1/sub_5_grad/Neg.gradients_1/sub_5_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0

 gradients_1/sub_5_grad/Reshape_1Reshapegradients_1/sub_5_grad/Sum_1gradients_1/sub_5_grad/Shape_1*
T0*
Tshape0
s
'gradients_1/sub_5_grad/tuple/group_depsNoOp^gradients_1/sub_5_grad/Reshape!^gradients_1/sub_5_grad/Reshape_1
Į
/gradients_1/sub_5_grad/tuple/control_dependencyIdentitygradients_1/sub_5_grad/Reshape(^gradients_1/sub_5_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_1/sub_5_grad/Reshape
Ē
1gradients_1/sub_5_grad/tuple/control_dependency_1Identity gradients_1/sub_5_grad/Reshape_1(^gradients_1/sub_5_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_1/sub_5_grad/Reshape_1
J
gradients_1/Neg_grad/NegNeg gradients_1/stack_1_grad/unstack*
T0
W
gradients_1/Sum_5_grad/ShapeShapeextrinsic_value/BiasAdd*
T0*
out_type0
v
gradients_1/Sum_5_grad/SizeConst*/
_class%
#!loc:@gradients_1/Sum_5_grad/Shape*
value	B :*
dtype0

gradients_1/Sum_5_grad/addAddV2Sum_5/reduction_indicesgradients_1/Sum_5_grad/Size*
T0*/
_class%
#!loc:@gradients_1/Sum_5_grad/Shape

gradients_1/Sum_5_grad/modFloorModgradients_1/Sum_5_grad/addgradients_1/Sum_5_grad/Size*
T0*/
_class%
#!loc:@gradients_1/Sum_5_grad/Shape
x
gradients_1/Sum_5_grad/Shape_1Const*/
_class%
#!loc:@gradients_1/Sum_5_grad/Shape*
valueB *
dtype0
}
"gradients_1/Sum_5_grad/range/startConst*/
_class%
#!loc:@gradients_1/Sum_5_grad/Shape*
value	B : *
dtype0
}
"gradients_1/Sum_5_grad/range/deltaConst*/
_class%
#!loc:@gradients_1/Sum_5_grad/Shape*
value	B :*
dtype0
Ē
gradients_1/Sum_5_grad/rangeRange"gradients_1/Sum_5_grad/range/startgradients_1/Sum_5_grad/Size"gradients_1/Sum_5_grad/range/delta*

Tidx0*/
_class%
#!loc:@gradients_1/Sum_5_grad/Shape
|
!gradients_1/Sum_5_grad/Fill/valueConst*/
_class%
#!loc:@gradients_1/Sum_5_grad/Shape*
value	B :*
dtype0
²
gradients_1/Sum_5_grad/FillFillgradients_1/Sum_5_grad/Shape_1!gradients_1/Sum_5_grad/Fill/value*
T0*/
_class%
#!loc:@gradients_1/Sum_5_grad/Shape*

index_type0
ķ
$gradients_1/Sum_5_grad/DynamicStitchDynamicStitchgradients_1/Sum_5_grad/rangegradients_1/Sum_5_grad/modgradients_1/Sum_5_grad/Shapegradients_1/Sum_5_grad/Fill*
T0*/
_class%
#!loc:@gradients_1/Sum_5_grad/Shape*
N
{
 gradients_1/Sum_5_grad/Maximum/yConst*/
_class%
#!loc:@gradients_1/Sum_5_grad/Shape*
value	B :*
dtype0
«
gradients_1/Sum_5_grad/MaximumMaximum$gradients_1/Sum_5_grad/DynamicStitch gradients_1/Sum_5_grad/Maximum/y*
T0*/
_class%
#!loc:@gradients_1/Sum_5_grad/Shape
£
gradients_1/Sum_5_grad/floordivFloorDivgradients_1/Sum_5_grad/Shapegradients_1/Sum_5_grad/Maximum*
T0*/
_class%
#!loc:@gradients_1/Sum_5_grad/Shape

gradients_1/Sum_5_grad/ReshapeReshape/gradients_1/sub_4_grad/tuple/control_dependency$gradients_1/Sum_5_grad/DynamicStitch*
T0*
Tshape0

gradients_1/Sum_5_grad/TileTilegradients_1/Sum_5_grad/Reshapegradients_1/Sum_5_grad/floordiv*

Tmultiples0*
T0
W
gradients_1/Sum_7_grad/ShapeShapecuriosity_value/BiasAdd*
T0*
out_type0
v
gradients_1/Sum_7_grad/SizeConst*/
_class%
#!loc:@gradients_1/Sum_7_grad/Shape*
value	B :*
dtype0

gradients_1/Sum_7_grad/addAddV2Sum_7/reduction_indicesgradients_1/Sum_7_grad/Size*
T0*/
_class%
#!loc:@gradients_1/Sum_7_grad/Shape

gradients_1/Sum_7_grad/modFloorModgradients_1/Sum_7_grad/addgradients_1/Sum_7_grad/Size*
T0*/
_class%
#!loc:@gradients_1/Sum_7_grad/Shape
x
gradients_1/Sum_7_grad/Shape_1Const*/
_class%
#!loc:@gradients_1/Sum_7_grad/Shape*
valueB *
dtype0
}
"gradients_1/Sum_7_grad/range/startConst*/
_class%
#!loc:@gradients_1/Sum_7_grad/Shape*
value	B : *
dtype0
}
"gradients_1/Sum_7_grad/range/deltaConst*/
_class%
#!loc:@gradients_1/Sum_7_grad/Shape*
value	B :*
dtype0
Ē
gradients_1/Sum_7_grad/rangeRange"gradients_1/Sum_7_grad/range/startgradients_1/Sum_7_grad/Size"gradients_1/Sum_7_grad/range/delta*

Tidx0*/
_class%
#!loc:@gradients_1/Sum_7_grad/Shape
|
!gradients_1/Sum_7_grad/Fill/valueConst*/
_class%
#!loc:@gradients_1/Sum_7_grad/Shape*
value	B :*
dtype0
²
gradients_1/Sum_7_grad/FillFillgradients_1/Sum_7_grad/Shape_1!gradients_1/Sum_7_grad/Fill/value*
T0*/
_class%
#!loc:@gradients_1/Sum_7_grad/Shape*

index_type0
ķ
$gradients_1/Sum_7_grad/DynamicStitchDynamicStitchgradients_1/Sum_7_grad/rangegradients_1/Sum_7_grad/modgradients_1/Sum_7_grad/Shapegradients_1/Sum_7_grad/Fill*
T0*/
_class%
#!loc:@gradients_1/Sum_7_grad/Shape*
N
{
 gradients_1/Sum_7_grad/Maximum/yConst*/
_class%
#!loc:@gradients_1/Sum_7_grad/Shape*
value	B :*
dtype0
«
gradients_1/Sum_7_grad/MaximumMaximum$gradients_1/Sum_7_grad/DynamicStitch gradients_1/Sum_7_grad/Maximum/y*
T0*/
_class%
#!loc:@gradients_1/Sum_7_grad/Shape
£
gradients_1/Sum_7_grad/floordivFloorDivgradients_1/Sum_7_grad/Shapegradients_1/Sum_7_grad/Maximum*
T0*/
_class%
#!loc:@gradients_1/Sum_7_grad/Shape

gradients_1/Sum_7_grad/ReshapeReshape/gradients_1/sub_5_grad/tuple/control_dependency$gradients_1/Sum_7_grad/DynamicStitch*
T0*
Tshape0

gradients_1/Sum_7_grad/TileTilegradients_1/Sum_7_grad/Reshapegradients_1/Sum_7_grad/floordiv*

Tmultiples0*
T0

Dgradients_1/softmax_cross_entropy_with_logits_1/Reshape_2_grad/ShapeShape#softmax_cross_entropy_with_logits_1*
T0*
out_type0
Č
Fgradients_1/softmax_cross_entropy_with_logits_1/Reshape_2_grad/ReshapeReshapegradients_1/Neg_grad/NegDgradients_1/softmax_cross_entropy_with_logits_1/Reshape_2_grad/Shape*
T0*
Tshape0

gradients_1/AddN_1AddNgradients_1/Sum_6_grad/Tilegradients_1/Sum_5_grad/Tile*
T0*.
_class$
" loc:@gradients_1/Sum_6_grad/Tile*
N
w
4gradients_1/extrinsic_value/BiasAdd_grad/BiasAddGradBiasAddGradgradients_1/AddN_1*
T0*
data_formatNHWC

9gradients_1/extrinsic_value/BiasAdd_grad/tuple/group_depsNoOp^gradients_1/AddN_15^gradients_1/extrinsic_value/BiasAdd_grad/BiasAddGrad
Ö
Agradients_1/extrinsic_value/BiasAdd_grad/tuple/control_dependencyIdentitygradients_1/AddN_1:^gradients_1/extrinsic_value/BiasAdd_grad/tuple/group_deps*
T0*.
_class$
" loc:@gradients_1/Sum_6_grad/Tile

Cgradients_1/extrinsic_value/BiasAdd_grad/tuple/control_dependency_1Identity4gradients_1/extrinsic_value/BiasAdd_grad/BiasAddGrad:^gradients_1/extrinsic_value/BiasAdd_grad/tuple/group_deps*
T0*G
_class=
;9loc:@gradients_1/extrinsic_value/BiasAdd_grad/BiasAddGrad

gradients_1/AddN_2AddNgradients_1/Sum_8_grad/Tilegradients_1/Sum_7_grad/Tile*
T0*.
_class$
" loc:@gradients_1/Sum_8_grad/Tile*
N
w
4gradients_1/curiosity_value/BiasAdd_grad/BiasAddGradBiasAddGradgradients_1/AddN_2*
T0*
data_formatNHWC

9gradients_1/curiosity_value/BiasAdd_grad/tuple/group_depsNoOp^gradients_1/AddN_25^gradients_1/curiosity_value/BiasAdd_grad/BiasAddGrad
Ö
Agradients_1/curiosity_value/BiasAdd_grad/tuple/control_dependencyIdentitygradients_1/AddN_2:^gradients_1/curiosity_value/BiasAdd_grad/tuple/group_deps*
T0*.
_class$
" loc:@gradients_1/Sum_8_grad/Tile

Cgradients_1/curiosity_value/BiasAdd_grad/tuple/control_dependency_1Identity4gradients_1/curiosity_value/BiasAdd_grad/BiasAddGrad:^gradients_1/curiosity_value/BiasAdd_grad/tuple/group_deps*
T0*G
_class=
;9loc:@gradients_1/curiosity_value/BiasAdd_grad/BiasAddGrad
U
gradients_1/zeros_like_5	ZerosLike%softmax_cross_entropy_with_logits_1:1*
T0
v
Cgradients_1/softmax_cross_entropy_with_logits_1_grad/ExpandDims/dimConst*
valueB :
’’’’’’’’’*
dtype0
ļ
?gradients_1/softmax_cross_entropy_with_logits_1_grad/ExpandDims
ExpandDimsFgradients_1/softmax_cross_entropy_with_logits_1/Reshape_2_grad/ReshapeCgradients_1/softmax_cross_entropy_with_logits_1_grad/ExpandDims/dim*

Tdim0*
T0
°
8gradients_1/softmax_cross_entropy_with_logits_1_grad/mulMul?gradients_1/softmax_cross_entropy_with_logits_1_grad/ExpandDims%softmax_cross_entropy_with_logits_1:1*
T0

?gradients_1/softmax_cross_entropy_with_logits_1_grad/LogSoftmax
LogSoftmax+softmax_cross_entropy_with_logits_1/Reshape*
T0

8gradients_1/softmax_cross_entropy_with_logits_1_grad/NegNeg?gradients_1/softmax_cross_entropy_with_logits_1_grad/LogSoftmax*
T0
x
Egradients_1/softmax_cross_entropy_with_logits_1_grad/ExpandDims_1/dimConst*
valueB :
’’’’’’’’’*
dtype0
ó
Agradients_1/softmax_cross_entropy_with_logits_1_grad/ExpandDims_1
ExpandDimsFgradients_1/softmax_cross_entropy_with_logits_1/Reshape_2_grad/ReshapeEgradients_1/softmax_cross_entropy_with_logits_1_grad/ExpandDims_1/dim*

Tdim0*
T0
Ē
:gradients_1/softmax_cross_entropy_with_logits_1_grad/mul_1MulAgradients_1/softmax_cross_entropy_with_logits_1_grad/ExpandDims_18gradients_1/softmax_cross_entropy_with_logits_1_grad/Neg*
T0
Å
Egradients_1/softmax_cross_entropy_with_logits_1_grad/tuple/group_depsNoOp9^gradients_1/softmax_cross_entropy_with_logits_1_grad/mul;^gradients_1/softmax_cross_entropy_with_logits_1_grad/mul_1
±
Mgradients_1/softmax_cross_entropy_with_logits_1_grad/tuple/control_dependencyIdentity8gradients_1/softmax_cross_entropy_with_logits_1_grad/mulF^gradients_1/softmax_cross_entropy_with_logits_1_grad/tuple/group_deps*
T0*K
_classA
?=loc:@gradients_1/softmax_cross_entropy_with_logits_1_grad/mul
·
Ogradients_1/softmax_cross_entropy_with_logits_1_grad/tuple/control_dependency_1Identity:gradients_1/softmax_cross_entropy_with_logits_1_grad/mul_1F^gradients_1/softmax_cross_entropy_with_logits_1_grad/tuple/group_deps*
T0*M
_classC
A?loc:@gradients_1/softmax_cross_entropy_with_logits_1_grad/mul_1
Ē
.gradients_1/extrinsic_value/MatMul_grad/MatMulMatMulAgradients_1/extrinsic_value/BiasAdd_grad/tuple/control_dependencyextrinsic_value/kernel/read*
transpose_b(*
T0*
transpose_a( 
Ē
0gradients_1/extrinsic_value/MatMul_grad/MatMul_1MatMulmain_graph_0/hidden_3/MulAgradients_1/extrinsic_value/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
¤
8gradients_1/extrinsic_value/MatMul_grad/tuple/group_depsNoOp/^gradients_1/extrinsic_value/MatMul_grad/MatMul1^gradients_1/extrinsic_value/MatMul_grad/MatMul_1

@gradients_1/extrinsic_value/MatMul_grad/tuple/control_dependencyIdentity.gradients_1/extrinsic_value/MatMul_grad/MatMul9^gradients_1/extrinsic_value/MatMul_grad/tuple/group_deps*
T0*A
_class7
53loc:@gradients_1/extrinsic_value/MatMul_grad/MatMul

Bgradients_1/extrinsic_value/MatMul_grad/tuple/control_dependency_1Identity0gradients_1/extrinsic_value/MatMul_grad/MatMul_19^gradients_1/extrinsic_value/MatMul_grad/tuple/group_deps*
T0*C
_class9
75loc:@gradients_1/extrinsic_value/MatMul_grad/MatMul_1
Ē
.gradients_1/curiosity_value/MatMul_grad/MatMulMatMulAgradients_1/curiosity_value/BiasAdd_grad/tuple/control_dependencycuriosity_value/kernel/read*
transpose_b(*
T0*
transpose_a( 
Ē
0gradients_1/curiosity_value/MatMul_grad/MatMul_1MatMulmain_graph_0/hidden_3/MulAgradients_1/curiosity_value/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
¤
8gradients_1/curiosity_value/MatMul_grad/tuple/group_depsNoOp/^gradients_1/curiosity_value/MatMul_grad/MatMul1^gradients_1/curiosity_value/MatMul_grad/MatMul_1

@gradients_1/curiosity_value/MatMul_grad/tuple/control_dependencyIdentity.gradients_1/curiosity_value/MatMul_grad/MatMul9^gradients_1/curiosity_value/MatMul_grad/tuple/group_deps*
T0*A
_class7
53loc:@gradients_1/curiosity_value/MatMul_grad/MatMul

Bgradients_1/curiosity_value/MatMul_grad/tuple/control_dependency_1Identity0gradients_1/curiosity_value/MatMul_grad/MatMul_19^gradients_1/curiosity_value/MatMul_grad/tuple/group_deps*
T0*C
_class9
75loc:@gradients_1/curiosity_value/MatMul_grad/MatMul_1
u
Bgradients_1/softmax_cross_entropy_with_logits_1/Reshape_grad/ShapeShapestrided_slice_8*
T0*
out_type0
ł
Dgradients_1/softmax_cross_entropy_with_logits_1/Reshape_grad/ReshapeReshapeMgradients_1/softmax_cross_entropy_with_logits_1_grad/tuple/control_dependencyBgradients_1/softmax_cross_entropy_with_logits_1/Reshape_grad/Shape*
T0*
Tshape0
Y
&gradients_1/strided_slice_8_grad/ShapeShapeconcat_2/concat*
T0*
out_type0
ö
1gradients_1/strided_slice_8_grad/StridedSliceGradStridedSliceGrad&gradients_1/strided_slice_8_grad/Shapestrided_slice_8/stackstrided_slice_8/stack_1strided_slice_8/stack_2Dgradients_1/softmax_cross_entropy_with_logits_1/Reshape_grad/Reshape*
Index0*
T0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
s
!gradients_1/Log_1_grad/Reciprocal
Reciprocaladd_82^gradients_1/strided_slice_8_grad/StridedSliceGrad*
T0

gradients_1/Log_1_grad/mulMul1gradients_1/strided_slice_8_grad/StridedSliceGrad!gradients_1/Log_1_grad/Reciprocal*
T0
I
gradients_1/add_8_grad/ShapeShape	truediv_3*
T0*
out_type0
I
gradients_1/add_8_grad/Shape_1Shapeadd_8/y*
T0*
out_type0

,gradients_1/add_8_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/add_8_grad/Shapegradients_1/add_8_grad/Shape_1*
T0

gradients_1/add_8_grad/SumSumgradients_1/Log_1_grad/mul,gradients_1/add_8_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
z
gradients_1/add_8_grad/ReshapeReshapegradients_1/add_8_grad/Sumgradients_1/add_8_grad/Shape*
T0*
Tshape0

gradients_1/add_8_grad/Sum_1Sumgradients_1/Log_1_grad/mul.gradients_1/add_8_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0

 gradients_1/add_8_grad/Reshape_1Reshapegradients_1/add_8_grad/Sum_1gradients_1/add_8_grad/Shape_1*
T0*
Tshape0
s
'gradients_1/add_8_grad/tuple/group_depsNoOp^gradients_1/add_8_grad/Reshape!^gradients_1/add_8_grad/Reshape_1
Į
/gradients_1/add_8_grad/tuple/control_dependencyIdentitygradients_1/add_8_grad/Reshape(^gradients_1/add_8_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_1/add_8_grad/Reshape
Ē
1gradients_1/add_8_grad/tuple/control_dependency_1Identity gradients_1/add_8_grad/Reshape_1(^gradients_1/add_8_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_1/add_8_grad/Reshape_1
I
 gradients_1/truediv_3_grad/ShapeShapeMul_1*
T0*
out_type0
I
"gradients_1/truediv_3_grad/Shape_1ShapeSum*
T0*
out_type0

0gradients_1/truediv_3_grad/BroadcastGradientArgsBroadcastGradientArgs gradients_1/truediv_3_grad/Shape"gradients_1/truediv_3_grad/Shape_1*
T0
l
"gradients_1/truediv_3_grad/RealDivRealDiv/gradients_1/add_8_grad/tuple/control_dependencySum*
T0
”
gradients_1/truediv_3_grad/SumSum"gradients_1/truediv_3_grad/RealDiv0gradients_1/truediv_3_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0

"gradients_1/truediv_3_grad/ReshapeReshapegradients_1/truediv_3_grad/Sum gradients_1/truediv_3_grad/Shape*
T0*
Tshape0
5
gradients_1/truediv_3_grad/NegNegMul_1*
T0
]
$gradients_1/truediv_3_grad/RealDiv_1RealDivgradients_1/truediv_3_grad/NegSum*
T0
c
$gradients_1/truediv_3_grad/RealDiv_2RealDiv$gradients_1/truediv_3_grad/RealDiv_1Sum*
T0

gradients_1/truediv_3_grad/mulMul/gradients_1/add_8_grad/tuple/control_dependency$gradients_1/truediv_3_grad/RealDiv_2*
T0
”
 gradients_1/truediv_3_grad/Sum_1Sumgradients_1/truediv_3_grad/mul2gradients_1/truediv_3_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0

$gradients_1/truediv_3_grad/Reshape_1Reshape gradients_1/truediv_3_grad/Sum_1"gradients_1/truediv_3_grad/Shape_1*
T0*
Tshape0

+gradients_1/truediv_3_grad/tuple/group_depsNoOp#^gradients_1/truediv_3_grad/Reshape%^gradients_1/truediv_3_grad/Reshape_1
Ń
3gradients_1/truediv_3_grad/tuple/control_dependencyIdentity"gradients_1/truediv_3_grad/Reshape,^gradients_1/truediv_3_grad/tuple/group_deps*
T0*5
_class+
)'loc:@gradients_1/truediv_3_grad/Reshape
×
5gradients_1/truediv_3_grad/tuple/control_dependency_1Identity$gradients_1/truediv_3_grad/Reshape_1,^gradients_1/truediv_3_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients_1/truediv_3_grad/Reshape_1
C
gradients_1/Sum_grad/ShapeShapeMul_1*
T0*
out_type0
r
gradients_1/Sum_grad/SizeConst*-
_class#
!loc:@gradients_1/Sum_grad/Shape*
value	B :*
dtype0

gradients_1/Sum_grad/addAddV2Sum/reduction_indicesgradients_1/Sum_grad/Size*
T0*-
_class#
!loc:@gradients_1/Sum_grad/Shape

gradients_1/Sum_grad/modFloorModgradients_1/Sum_grad/addgradients_1/Sum_grad/Size*
T0*-
_class#
!loc:@gradients_1/Sum_grad/Shape
t
gradients_1/Sum_grad/Shape_1Const*-
_class#
!loc:@gradients_1/Sum_grad/Shape*
valueB *
dtype0
y
 gradients_1/Sum_grad/range/startConst*-
_class#
!loc:@gradients_1/Sum_grad/Shape*
value	B : *
dtype0
y
 gradients_1/Sum_grad/range/deltaConst*-
_class#
!loc:@gradients_1/Sum_grad/Shape*
value	B :*
dtype0
½
gradients_1/Sum_grad/rangeRange gradients_1/Sum_grad/range/startgradients_1/Sum_grad/Size gradients_1/Sum_grad/range/delta*

Tidx0*-
_class#
!loc:@gradients_1/Sum_grad/Shape
x
gradients_1/Sum_grad/Fill/valueConst*-
_class#
!loc:@gradients_1/Sum_grad/Shape*
value	B :*
dtype0
Ŗ
gradients_1/Sum_grad/FillFillgradients_1/Sum_grad/Shape_1gradients_1/Sum_grad/Fill/value*
T0*-
_class#
!loc:@gradients_1/Sum_grad/Shape*

index_type0
į
"gradients_1/Sum_grad/DynamicStitchDynamicStitchgradients_1/Sum_grad/rangegradients_1/Sum_grad/modgradients_1/Sum_grad/Shapegradients_1/Sum_grad/Fill*
T0*-
_class#
!loc:@gradients_1/Sum_grad/Shape*
N
w
gradients_1/Sum_grad/Maximum/yConst*-
_class#
!loc:@gradients_1/Sum_grad/Shape*
value	B :*
dtype0
£
gradients_1/Sum_grad/MaximumMaximum"gradients_1/Sum_grad/DynamicStitchgradients_1/Sum_grad/Maximum/y*
T0*-
_class#
!loc:@gradients_1/Sum_grad/Shape

gradients_1/Sum_grad/floordivFloorDivgradients_1/Sum_grad/Shapegradients_1/Sum_grad/Maximum*
T0*-
_class#
!loc:@gradients_1/Sum_grad/Shape

gradients_1/Sum_grad/ReshapeReshape5gradients_1/truediv_3_grad/tuple/control_dependency_1"gradients_1/Sum_grad/DynamicStitch*
T0*
Tshape0
y
gradients_1/Sum_grad/TileTilegradients_1/Sum_grad/Reshapegradients_1/Sum_grad/floordiv*

Tmultiples0*
T0
³
gradients_1/AddN_3AddN3gradients_1/truediv_3_grad/tuple/control_dependencygradients_1/Sum_grad/Tile*
T0*5
_class+
)'loc:@gradients_1/truediv_3_grad/Reshape*
N
E
gradients_1/Mul_1_grad/ShapeShapeadd_6*
T0*
out_type0
Q
gradients_1/Mul_1_grad/Shape_1Shapestrided_slice_1*
T0*
out_type0

,gradients_1/Mul_1_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/Mul_1_grad/Shapegradients_1/Mul_1_grad/Shape_1*
T0
O
gradients_1/Mul_1_grad/MulMulgradients_1/AddN_3strided_slice_1*
T0

gradients_1/Mul_1_grad/SumSumgradients_1/Mul_1_grad/Mul,gradients_1/Mul_1_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
z
gradients_1/Mul_1_grad/ReshapeReshapegradients_1/Mul_1_grad/Sumgradients_1/Mul_1_grad/Shape*
T0*
Tshape0
G
gradients_1/Mul_1_grad/Mul_1Muladd_6gradients_1/AddN_3*
T0

gradients_1/Mul_1_grad/Sum_1Sumgradients_1/Mul_1_grad/Mul_1.gradients_1/Mul_1_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0

 gradients_1/Mul_1_grad/Reshape_1Reshapegradients_1/Mul_1_grad/Sum_1gradients_1/Mul_1_grad/Shape_1*
T0*
Tshape0
s
'gradients_1/Mul_1_grad/tuple/group_depsNoOp^gradients_1/Mul_1_grad/Reshape!^gradients_1/Mul_1_grad/Reshape_1
Į
/gradients_1/Mul_1_grad/tuple/control_dependencyIdentitygradients_1/Mul_1_grad/Reshape(^gradients_1/Mul_1_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_1/Mul_1_grad/Reshape
Ē
1gradients_1/Mul_1_grad/tuple/control_dependency_1Identity gradients_1/Mul_1_grad/Reshape_1(^gradients_1/Mul_1_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_1/Mul_1_grad/Reshape_1
G
gradients_1/add_6_grad/ShapeShapeSoftmax*
T0*
out_type0
I
gradients_1/add_6_grad/Shape_1Shapeadd_6/y*
T0*
out_type0

,gradients_1/add_6_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/add_6_grad/Shapegradients_1/add_6_grad/Shape_1*
T0
¦
gradients_1/add_6_grad/SumSum/gradients_1/Mul_1_grad/tuple/control_dependency,gradients_1/add_6_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
z
gradients_1/add_6_grad/ReshapeReshapegradients_1/add_6_grad/Sumgradients_1/add_6_grad/Shape*
T0*
Tshape0
Ŗ
gradients_1/add_6_grad/Sum_1Sum/gradients_1/Mul_1_grad/tuple/control_dependency.gradients_1/add_6_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0

 gradients_1/add_6_grad/Reshape_1Reshapegradients_1/add_6_grad/Sum_1gradients_1/add_6_grad/Shape_1*
T0*
Tshape0
s
'gradients_1/add_6_grad/tuple/group_depsNoOp^gradients_1/add_6_grad/Reshape!^gradients_1/add_6_grad/Reshape_1
Į
/gradients_1/add_6_grad/tuple/control_dependencyIdentitygradients_1/add_6_grad/Reshape(^gradients_1/add_6_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_1/add_6_grad/Reshape
Ē
1gradients_1/add_6_grad/tuple/control_dependency_1Identity gradients_1/add_6_grad/Reshape_1(^gradients_1/add_6_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_1/add_6_grad/Reshape_1
f
gradients_1/Softmax_grad/mulMul/gradients_1/add_6_grad/tuple/control_dependencySoftmax*
T0
a
.gradients_1/Softmax_grad/Sum/reduction_indicesConst*
valueB :
’’’’’’’’’*
dtype0

gradients_1/Softmax_grad/SumSumgradients_1/Softmax_grad/mul.gradients_1/Softmax_grad/Sum/reduction_indices*

Tidx0*
	keep_dims(*
T0
{
gradients_1/Softmax_grad/subSub/gradients_1/add_6_grad/tuple/control_dependencygradients_1/Softmax_grad/Sum*
T0
U
gradients_1/Softmax_grad/mul_1Mulgradients_1/Softmax_grad/subSoftmax*
T0
a
$gradients_1/strided_slice_grad/ShapeShapeaction_probs/action_probs*
T0*
out_type0
Ę
/gradients_1/strided_slice_grad/StridedSliceGradStridedSliceGrad$gradients_1/strided_slice_grad/Shapestrided_slice/stackstrided_slice/stack_1strided_slice/stack_2gradients_1/Softmax_grad/mul_1*
Index0*
T0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask

gradients_1/AddN_4AddN1gradients_1/strided_slice_6_grad/StridedSliceGrad1gradients_1/strided_slice_5_grad/StridedSliceGrad/gradients_1/strided_slice_grad/StridedSliceGrad*
T0*D
_class:
86loc:@gradients_1/strided_slice_6_grad/StridedSliceGrad*
N

$gradients_1/dense/MatMul_grad/MatMulMatMulgradients_1/AddN_4dense/kernel/read*
transpose_b(*
T0*
transpose_a( 

&gradients_1/dense/MatMul_grad/MatMul_1MatMulmain_graph_0/hidden_3/Mulgradients_1/AddN_4*
transpose_b( *
T0*
transpose_a(

.gradients_1/dense/MatMul_grad/tuple/group_depsNoOp%^gradients_1/dense/MatMul_grad/MatMul'^gradients_1/dense/MatMul_grad/MatMul_1
Ū
6gradients_1/dense/MatMul_grad/tuple/control_dependencyIdentity$gradients_1/dense/MatMul_grad/MatMul/^gradients_1/dense/MatMul_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients_1/dense/MatMul_grad/MatMul
į
8gradients_1/dense/MatMul_grad/tuple/control_dependency_1Identity&gradients_1/dense/MatMul_grad/MatMul_1/^gradients_1/dense/MatMul_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients_1/dense/MatMul_grad/MatMul_1
«
gradients_1/AddN_5AddN@gradients_1/extrinsic_value/MatMul_grad/tuple/control_dependency@gradients_1/curiosity_value/MatMul_grad/tuple/control_dependency6gradients_1/dense/MatMul_grad/tuple/control_dependency*
T0*A
_class7
53loc:@gradients_1/extrinsic_value/MatMul_grad/MatMul*
N
q
0gradients_1/main_graph_0/hidden_3/Mul_grad/ShapeShapemain_graph_0/hidden_3/BiasAdd*
T0*
out_type0
s
2gradients_1/main_graph_0/hidden_3/Mul_grad/Shape_1Shapemain_graph_0/hidden_3/Sigmoid*
T0*
out_type0
Č
@gradients_1/main_graph_0/hidden_3/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs0gradients_1/main_graph_0/hidden_3/Mul_grad/Shape2gradients_1/main_graph_0/hidden_3/Mul_grad/Shape_1*
T0
q
.gradients_1/main_graph_0/hidden_3/Mul_grad/MulMulgradients_1/AddN_5main_graph_0/hidden_3/Sigmoid*
T0
Ķ
.gradients_1/main_graph_0/hidden_3/Mul_grad/SumSum.gradients_1/main_graph_0/hidden_3/Mul_grad/Mul@gradients_1/main_graph_0/hidden_3/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
¶
2gradients_1/main_graph_0/hidden_3/Mul_grad/ReshapeReshape.gradients_1/main_graph_0/hidden_3/Mul_grad/Sum0gradients_1/main_graph_0/hidden_3/Mul_grad/Shape*
T0*
Tshape0
s
0gradients_1/main_graph_0/hidden_3/Mul_grad/Mul_1Mulmain_graph_0/hidden_3/BiasAddgradients_1/AddN_5*
T0
Ó
0gradients_1/main_graph_0/hidden_3/Mul_grad/Sum_1Sum0gradients_1/main_graph_0/hidden_3/Mul_grad/Mul_1Bgradients_1/main_graph_0/hidden_3/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
¼
4gradients_1/main_graph_0/hidden_3/Mul_grad/Reshape_1Reshape0gradients_1/main_graph_0/hidden_3/Mul_grad/Sum_12gradients_1/main_graph_0/hidden_3/Mul_grad/Shape_1*
T0*
Tshape0
Æ
;gradients_1/main_graph_0/hidden_3/Mul_grad/tuple/group_depsNoOp3^gradients_1/main_graph_0/hidden_3/Mul_grad/Reshape5^gradients_1/main_graph_0/hidden_3/Mul_grad/Reshape_1

Cgradients_1/main_graph_0/hidden_3/Mul_grad/tuple/control_dependencyIdentity2gradients_1/main_graph_0/hidden_3/Mul_grad/Reshape<^gradients_1/main_graph_0/hidden_3/Mul_grad/tuple/group_deps*
T0*E
_class;
97loc:@gradients_1/main_graph_0/hidden_3/Mul_grad/Reshape

Egradients_1/main_graph_0/hidden_3/Mul_grad/tuple/control_dependency_1Identity4gradients_1/main_graph_0/hidden_3/Mul_grad/Reshape_1<^gradients_1/main_graph_0/hidden_3/Mul_grad/tuple/group_deps*
T0*G
_class=
;9loc:@gradients_1/main_graph_0/hidden_3/Mul_grad/Reshape_1
ø
:gradients_1/main_graph_0/hidden_3/Sigmoid_grad/SigmoidGradSigmoidGradmain_graph_0/hidden_3/SigmoidEgradients_1/main_graph_0/hidden_3/Mul_grad/tuple/control_dependency_1*
T0
ō
gradients_1/AddN_6AddNCgradients_1/main_graph_0/hidden_3/Mul_grad/tuple/control_dependency:gradients_1/main_graph_0/hidden_3/Sigmoid_grad/SigmoidGrad*
T0*E
_class;
97loc:@gradients_1/main_graph_0/hidden_3/Mul_grad/Reshape*
N
}
:gradients_1/main_graph_0/hidden_3/BiasAdd_grad/BiasAddGradBiasAddGradgradients_1/AddN_6*
T0*
data_formatNHWC

?gradients_1/main_graph_0/hidden_3/BiasAdd_grad/tuple/group_depsNoOp^gradients_1/AddN_6;^gradients_1/main_graph_0/hidden_3/BiasAdd_grad/BiasAddGrad
ł
Ggradients_1/main_graph_0/hidden_3/BiasAdd_grad/tuple/control_dependencyIdentitygradients_1/AddN_6@^gradients_1/main_graph_0/hidden_3/BiasAdd_grad/tuple/group_deps*
T0*E
_class;
97loc:@gradients_1/main_graph_0/hidden_3/Mul_grad/Reshape
«
Igradients_1/main_graph_0/hidden_3/BiasAdd_grad/tuple/control_dependency_1Identity:gradients_1/main_graph_0/hidden_3/BiasAdd_grad/BiasAddGrad@^gradients_1/main_graph_0/hidden_3/BiasAdd_grad/tuple/group_deps*
T0*M
_classC
A?loc:@gradients_1/main_graph_0/hidden_3/BiasAdd_grad/BiasAddGrad
Ł
4gradients_1/main_graph_0/hidden_3/MatMul_grad/MatMulMatMulGgradients_1/main_graph_0/hidden_3/BiasAdd_grad/tuple/control_dependency!main_graph_0/hidden_3/kernel/read*
transpose_b(*
T0*
transpose_a( 
Ó
6gradients_1/main_graph_0/hidden_3/MatMul_grad/MatMul_1MatMulmain_graph_0/hidden_2/MulGgradients_1/main_graph_0/hidden_3/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
¶
>gradients_1/main_graph_0/hidden_3/MatMul_grad/tuple/group_depsNoOp5^gradients_1/main_graph_0/hidden_3/MatMul_grad/MatMul7^gradients_1/main_graph_0/hidden_3/MatMul_grad/MatMul_1

Fgradients_1/main_graph_0/hidden_3/MatMul_grad/tuple/control_dependencyIdentity4gradients_1/main_graph_0/hidden_3/MatMul_grad/MatMul?^gradients_1/main_graph_0/hidden_3/MatMul_grad/tuple/group_deps*
T0*G
_class=
;9loc:@gradients_1/main_graph_0/hidden_3/MatMul_grad/MatMul
”
Hgradients_1/main_graph_0/hidden_3/MatMul_grad/tuple/control_dependency_1Identity6gradients_1/main_graph_0/hidden_3/MatMul_grad/MatMul_1?^gradients_1/main_graph_0/hidden_3/MatMul_grad/tuple/group_deps*
T0*I
_class?
=;loc:@gradients_1/main_graph_0/hidden_3/MatMul_grad/MatMul_1
q
0gradients_1/main_graph_0/hidden_2/Mul_grad/ShapeShapemain_graph_0/hidden_2/BiasAdd*
T0*
out_type0
s
2gradients_1/main_graph_0/hidden_2/Mul_grad/Shape_1Shapemain_graph_0/hidden_2/Sigmoid*
T0*
out_type0
Č
@gradients_1/main_graph_0/hidden_2/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs0gradients_1/main_graph_0/hidden_2/Mul_grad/Shape2gradients_1/main_graph_0/hidden_2/Mul_grad/Shape_1*
T0
„
.gradients_1/main_graph_0/hidden_2/Mul_grad/MulMulFgradients_1/main_graph_0/hidden_3/MatMul_grad/tuple/control_dependencymain_graph_0/hidden_2/Sigmoid*
T0
Ķ
.gradients_1/main_graph_0/hidden_2/Mul_grad/SumSum.gradients_1/main_graph_0/hidden_2/Mul_grad/Mul@gradients_1/main_graph_0/hidden_2/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
¶
2gradients_1/main_graph_0/hidden_2/Mul_grad/ReshapeReshape.gradients_1/main_graph_0/hidden_2/Mul_grad/Sum0gradients_1/main_graph_0/hidden_2/Mul_grad/Shape*
T0*
Tshape0
§
0gradients_1/main_graph_0/hidden_2/Mul_grad/Mul_1Mulmain_graph_0/hidden_2/BiasAddFgradients_1/main_graph_0/hidden_3/MatMul_grad/tuple/control_dependency*
T0
Ó
0gradients_1/main_graph_0/hidden_2/Mul_grad/Sum_1Sum0gradients_1/main_graph_0/hidden_2/Mul_grad/Mul_1Bgradients_1/main_graph_0/hidden_2/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
¼
4gradients_1/main_graph_0/hidden_2/Mul_grad/Reshape_1Reshape0gradients_1/main_graph_0/hidden_2/Mul_grad/Sum_12gradients_1/main_graph_0/hidden_2/Mul_grad/Shape_1*
T0*
Tshape0
Æ
;gradients_1/main_graph_0/hidden_2/Mul_grad/tuple/group_depsNoOp3^gradients_1/main_graph_0/hidden_2/Mul_grad/Reshape5^gradients_1/main_graph_0/hidden_2/Mul_grad/Reshape_1

Cgradients_1/main_graph_0/hidden_2/Mul_grad/tuple/control_dependencyIdentity2gradients_1/main_graph_0/hidden_2/Mul_grad/Reshape<^gradients_1/main_graph_0/hidden_2/Mul_grad/tuple/group_deps*
T0*E
_class;
97loc:@gradients_1/main_graph_0/hidden_2/Mul_grad/Reshape

Egradients_1/main_graph_0/hidden_2/Mul_grad/tuple/control_dependency_1Identity4gradients_1/main_graph_0/hidden_2/Mul_grad/Reshape_1<^gradients_1/main_graph_0/hidden_2/Mul_grad/tuple/group_deps*
T0*G
_class=
;9loc:@gradients_1/main_graph_0/hidden_2/Mul_grad/Reshape_1
ø
:gradients_1/main_graph_0/hidden_2/Sigmoid_grad/SigmoidGradSigmoidGradmain_graph_0/hidden_2/SigmoidEgradients_1/main_graph_0/hidden_2/Mul_grad/tuple/control_dependency_1*
T0
ō
gradients_1/AddN_7AddNCgradients_1/main_graph_0/hidden_2/Mul_grad/tuple/control_dependency:gradients_1/main_graph_0/hidden_2/Sigmoid_grad/SigmoidGrad*
T0*E
_class;
97loc:@gradients_1/main_graph_0/hidden_2/Mul_grad/Reshape*
N
}
:gradients_1/main_graph_0/hidden_2/BiasAdd_grad/BiasAddGradBiasAddGradgradients_1/AddN_7*
T0*
data_formatNHWC

?gradients_1/main_graph_0/hidden_2/BiasAdd_grad/tuple/group_depsNoOp^gradients_1/AddN_7;^gradients_1/main_graph_0/hidden_2/BiasAdd_grad/BiasAddGrad
ł
Ggradients_1/main_graph_0/hidden_2/BiasAdd_grad/tuple/control_dependencyIdentitygradients_1/AddN_7@^gradients_1/main_graph_0/hidden_2/BiasAdd_grad/tuple/group_deps*
T0*E
_class;
97loc:@gradients_1/main_graph_0/hidden_2/Mul_grad/Reshape
«
Igradients_1/main_graph_0/hidden_2/BiasAdd_grad/tuple/control_dependency_1Identity:gradients_1/main_graph_0/hidden_2/BiasAdd_grad/BiasAddGrad@^gradients_1/main_graph_0/hidden_2/BiasAdd_grad/tuple/group_deps*
T0*M
_classC
A?loc:@gradients_1/main_graph_0/hidden_2/BiasAdd_grad/BiasAddGrad
Ł
4gradients_1/main_graph_0/hidden_2/MatMul_grad/MatMulMatMulGgradients_1/main_graph_0/hidden_2/BiasAdd_grad/tuple/control_dependency!main_graph_0/hidden_2/kernel/read*
transpose_b(*
T0*
transpose_a( 
Ó
6gradients_1/main_graph_0/hidden_2/MatMul_grad/MatMul_1MatMulmain_graph_0/hidden_1/MulGgradients_1/main_graph_0/hidden_2/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
¶
>gradients_1/main_graph_0/hidden_2/MatMul_grad/tuple/group_depsNoOp5^gradients_1/main_graph_0/hidden_2/MatMul_grad/MatMul7^gradients_1/main_graph_0/hidden_2/MatMul_grad/MatMul_1

Fgradients_1/main_graph_0/hidden_2/MatMul_grad/tuple/control_dependencyIdentity4gradients_1/main_graph_0/hidden_2/MatMul_grad/MatMul?^gradients_1/main_graph_0/hidden_2/MatMul_grad/tuple/group_deps*
T0*G
_class=
;9loc:@gradients_1/main_graph_0/hidden_2/MatMul_grad/MatMul
”
Hgradients_1/main_graph_0/hidden_2/MatMul_grad/tuple/control_dependency_1Identity6gradients_1/main_graph_0/hidden_2/MatMul_grad/MatMul_1?^gradients_1/main_graph_0/hidden_2/MatMul_grad/tuple/group_deps*
T0*I
_class?
=;loc:@gradients_1/main_graph_0/hidden_2/MatMul_grad/MatMul_1
q
0gradients_1/main_graph_0/hidden_1/Mul_grad/ShapeShapemain_graph_0/hidden_1/BiasAdd*
T0*
out_type0
s
2gradients_1/main_graph_0/hidden_1/Mul_grad/Shape_1Shapemain_graph_0/hidden_1/Sigmoid*
T0*
out_type0
Č
@gradients_1/main_graph_0/hidden_1/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs0gradients_1/main_graph_0/hidden_1/Mul_grad/Shape2gradients_1/main_graph_0/hidden_1/Mul_grad/Shape_1*
T0
„
.gradients_1/main_graph_0/hidden_1/Mul_grad/MulMulFgradients_1/main_graph_0/hidden_2/MatMul_grad/tuple/control_dependencymain_graph_0/hidden_1/Sigmoid*
T0
Ķ
.gradients_1/main_graph_0/hidden_1/Mul_grad/SumSum.gradients_1/main_graph_0/hidden_1/Mul_grad/Mul@gradients_1/main_graph_0/hidden_1/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
¶
2gradients_1/main_graph_0/hidden_1/Mul_grad/ReshapeReshape.gradients_1/main_graph_0/hidden_1/Mul_grad/Sum0gradients_1/main_graph_0/hidden_1/Mul_grad/Shape*
T0*
Tshape0
§
0gradients_1/main_graph_0/hidden_1/Mul_grad/Mul_1Mulmain_graph_0/hidden_1/BiasAddFgradients_1/main_graph_0/hidden_2/MatMul_grad/tuple/control_dependency*
T0
Ó
0gradients_1/main_graph_0/hidden_1/Mul_grad/Sum_1Sum0gradients_1/main_graph_0/hidden_1/Mul_grad/Mul_1Bgradients_1/main_graph_0/hidden_1/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
¼
4gradients_1/main_graph_0/hidden_1/Mul_grad/Reshape_1Reshape0gradients_1/main_graph_0/hidden_1/Mul_grad/Sum_12gradients_1/main_graph_0/hidden_1/Mul_grad/Shape_1*
T0*
Tshape0
Æ
;gradients_1/main_graph_0/hidden_1/Mul_grad/tuple/group_depsNoOp3^gradients_1/main_graph_0/hidden_1/Mul_grad/Reshape5^gradients_1/main_graph_0/hidden_1/Mul_grad/Reshape_1

Cgradients_1/main_graph_0/hidden_1/Mul_grad/tuple/control_dependencyIdentity2gradients_1/main_graph_0/hidden_1/Mul_grad/Reshape<^gradients_1/main_graph_0/hidden_1/Mul_grad/tuple/group_deps*
T0*E
_class;
97loc:@gradients_1/main_graph_0/hidden_1/Mul_grad/Reshape

Egradients_1/main_graph_0/hidden_1/Mul_grad/tuple/control_dependency_1Identity4gradients_1/main_graph_0/hidden_1/Mul_grad/Reshape_1<^gradients_1/main_graph_0/hidden_1/Mul_grad/tuple/group_deps*
T0*G
_class=
;9loc:@gradients_1/main_graph_0/hidden_1/Mul_grad/Reshape_1
ø
:gradients_1/main_graph_0/hidden_1/Sigmoid_grad/SigmoidGradSigmoidGradmain_graph_0/hidden_1/SigmoidEgradients_1/main_graph_0/hidden_1/Mul_grad/tuple/control_dependency_1*
T0
ō
gradients_1/AddN_8AddNCgradients_1/main_graph_0/hidden_1/Mul_grad/tuple/control_dependency:gradients_1/main_graph_0/hidden_1/Sigmoid_grad/SigmoidGrad*
T0*E
_class;
97loc:@gradients_1/main_graph_0/hidden_1/Mul_grad/Reshape*
N
}
:gradients_1/main_graph_0/hidden_1/BiasAdd_grad/BiasAddGradBiasAddGradgradients_1/AddN_8*
T0*
data_formatNHWC

?gradients_1/main_graph_0/hidden_1/BiasAdd_grad/tuple/group_depsNoOp^gradients_1/AddN_8;^gradients_1/main_graph_0/hidden_1/BiasAdd_grad/BiasAddGrad
ł
Ggradients_1/main_graph_0/hidden_1/BiasAdd_grad/tuple/control_dependencyIdentitygradients_1/AddN_8@^gradients_1/main_graph_0/hidden_1/BiasAdd_grad/tuple/group_deps*
T0*E
_class;
97loc:@gradients_1/main_graph_0/hidden_1/Mul_grad/Reshape
«
Igradients_1/main_graph_0/hidden_1/BiasAdd_grad/tuple/control_dependency_1Identity:gradients_1/main_graph_0/hidden_1/BiasAdd_grad/BiasAddGrad@^gradients_1/main_graph_0/hidden_1/BiasAdd_grad/tuple/group_deps*
T0*M
_classC
A?loc:@gradients_1/main_graph_0/hidden_1/BiasAdd_grad/BiasAddGrad
Ł
4gradients_1/main_graph_0/hidden_1/MatMul_grad/MatMulMatMulGgradients_1/main_graph_0/hidden_1/BiasAdd_grad/tuple/control_dependency!main_graph_0/hidden_1/kernel/read*
transpose_b(*
T0*
transpose_a( 
Ó
6gradients_1/main_graph_0/hidden_1/MatMul_grad/MatMul_1MatMulmain_graph_0/hidden_0/MulGgradients_1/main_graph_0/hidden_1/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
¶
>gradients_1/main_graph_0/hidden_1/MatMul_grad/tuple/group_depsNoOp5^gradients_1/main_graph_0/hidden_1/MatMul_grad/MatMul7^gradients_1/main_graph_0/hidden_1/MatMul_grad/MatMul_1

Fgradients_1/main_graph_0/hidden_1/MatMul_grad/tuple/control_dependencyIdentity4gradients_1/main_graph_0/hidden_1/MatMul_grad/MatMul?^gradients_1/main_graph_0/hidden_1/MatMul_grad/tuple/group_deps*
T0*G
_class=
;9loc:@gradients_1/main_graph_0/hidden_1/MatMul_grad/MatMul
”
Hgradients_1/main_graph_0/hidden_1/MatMul_grad/tuple/control_dependency_1Identity6gradients_1/main_graph_0/hidden_1/MatMul_grad/MatMul_1?^gradients_1/main_graph_0/hidden_1/MatMul_grad/tuple/group_deps*
T0*I
_class?
=;loc:@gradients_1/main_graph_0/hidden_1/MatMul_grad/MatMul_1
q
0gradients_1/main_graph_0/hidden_0/Mul_grad/ShapeShapemain_graph_0/hidden_0/BiasAdd*
T0*
out_type0
s
2gradients_1/main_graph_0/hidden_0/Mul_grad/Shape_1Shapemain_graph_0/hidden_0/Sigmoid*
T0*
out_type0
Č
@gradients_1/main_graph_0/hidden_0/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs0gradients_1/main_graph_0/hidden_0/Mul_grad/Shape2gradients_1/main_graph_0/hidden_0/Mul_grad/Shape_1*
T0
„
.gradients_1/main_graph_0/hidden_0/Mul_grad/MulMulFgradients_1/main_graph_0/hidden_1/MatMul_grad/tuple/control_dependencymain_graph_0/hidden_0/Sigmoid*
T0
Ķ
.gradients_1/main_graph_0/hidden_0/Mul_grad/SumSum.gradients_1/main_graph_0/hidden_0/Mul_grad/Mul@gradients_1/main_graph_0/hidden_0/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
¶
2gradients_1/main_graph_0/hidden_0/Mul_grad/ReshapeReshape.gradients_1/main_graph_0/hidden_0/Mul_grad/Sum0gradients_1/main_graph_0/hidden_0/Mul_grad/Shape*
T0*
Tshape0
§
0gradients_1/main_graph_0/hidden_0/Mul_grad/Mul_1Mulmain_graph_0/hidden_0/BiasAddFgradients_1/main_graph_0/hidden_1/MatMul_grad/tuple/control_dependency*
T0
Ó
0gradients_1/main_graph_0/hidden_0/Mul_grad/Sum_1Sum0gradients_1/main_graph_0/hidden_0/Mul_grad/Mul_1Bgradients_1/main_graph_0/hidden_0/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
¼
4gradients_1/main_graph_0/hidden_0/Mul_grad/Reshape_1Reshape0gradients_1/main_graph_0/hidden_0/Mul_grad/Sum_12gradients_1/main_graph_0/hidden_0/Mul_grad/Shape_1*
T0*
Tshape0
Æ
;gradients_1/main_graph_0/hidden_0/Mul_grad/tuple/group_depsNoOp3^gradients_1/main_graph_0/hidden_0/Mul_grad/Reshape5^gradients_1/main_graph_0/hidden_0/Mul_grad/Reshape_1

Cgradients_1/main_graph_0/hidden_0/Mul_grad/tuple/control_dependencyIdentity2gradients_1/main_graph_0/hidden_0/Mul_grad/Reshape<^gradients_1/main_graph_0/hidden_0/Mul_grad/tuple/group_deps*
T0*E
_class;
97loc:@gradients_1/main_graph_0/hidden_0/Mul_grad/Reshape

Egradients_1/main_graph_0/hidden_0/Mul_grad/tuple/control_dependency_1Identity4gradients_1/main_graph_0/hidden_0/Mul_grad/Reshape_1<^gradients_1/main_graph_0/hidden_0/Mul_grad/tuple/group_deps*
T0*G
_class=
;9loc:@gradients_1/main_graph_0/hidden_0/Mul_grad/Reshape_1
ø
:gradients_1/main_graph_0/hidden_0/Sigmoid_grad/SigmoidGradSigmoidGradmain_graph_0/hidden_0/SigmoidEgradients_1/main_graph_0/hidden_0/Mul_grad/tuple/control_dependency_1*
T0
ō
gradients_1/AddN_9AddNCgradients_1/main_graph_0/hidden_0/Mul_grad/tuple/control_dependency:gradients_1/main_graph_0/hidden_0/Sigmoid_grad/SigmoidGrad*
T0*E
_class;
97loc:@gradients_1/main_graph_0/hidden_0/Mul_grad/Reshape*
N
}
:gradients_1/main_graph_0/hidden_0/BiasAdd_grad/BiasAddGradBiasAddGradgradients_1/AddN_9*
T0*
data_formatNHWC

?gradients_1/main_graph_0/hidden_0/BiasAdd_grad/tuple/group_depsNoOp^gradients_1/AddN_9;^gradients_1/main_graph_0/hidden_0/BiasAdd_grad/BiasAddGrad
ł
Ggradients_1/main_graph_0/hidden_0/BiasAdd_grad/tuple/control_dependencyIdentitygradients_1/AddN_9@^gradients_1/main_graph_0/hidden_0/BiasAdd_grad/tuple/group_deps*
T0*E
_class;
97loc:@gradients_1/main_graph_0/hidden_0/Mul_grad/Reshape
«
Igradients_1/main_graph_0/hidden_0/BiasAdd_grad/tuple/control_dependency_1Identity:gradients_1/main_graph_0/hidden_0/BiasAdd_grad/BiasAddGrad@^gradients_1/main_graph_0/hidden_0/BiasAdd_grad/tuple/group_deps*
T0*M
_classC
A?loc:@gradients_1/main_graph_0/hidden_0/BiasAdd_grad/BiasAddGrad
Ł
4gradients_1/main_graph_0/hidden_0/MatMul_grad/MatMulMatMulGgradients_1/main_graph_0/hidden_0/BiasAdd_grad/tuple/control_dependency!main_graph_0/hidden_0/kernel/read*
transpose_b(*
T0*
transpose_a( 
Ź
6gradients_1/main_graph_0/hidden_0/MatMul_grad/MatMul_1MatMulnormalized_stateGgradients_1/main_graph_0/hidden_0/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
¶
>gradients_1/main_graph_0/hidden_0/MatMul_grad/tuple/group_depsNoOp5^gradients_1/main_graph_0/hidden_0/MatMul_grad/MatMul7^gradients_1/main_graph_0/hidden_0/MatMul_grad/MatMul_1

Fgradients_1/main_graph_0/hidden_0/MatMul_grad/tuple/control_dependencyIdentity4gradients_1/main_graph_0/hidden_0/MatMul_grad/MatMul?^gradients_1/main_graph_0/hidden_0/MatMul_grad/tuple/group_deps*
T0*G
_class=
;9loc:@gradients_1/main_graph_0/hidden_0/MatMul_grad/MatMul
”
Hgradients_1/main_graph_0/hidden_0/MatMul_grad/tuple/control_dependency_1Identity6gradients_1/main_graph_0/hidden_0/MatMul_grad/MatMul_1?^gradients_1/main_graph_0/hidden_0/MatMul_grad/tuple/group_deps*
T0*I
_class?
=;loc:@gradients_1/main_graph_0/hidden_0/MatMul_grad/MatMul_1
o
beta1_power/initial_valueConst*'
_class
loc:@curiosity_value/bias*
valueB
 *fff?*
dtype0

beta1_power
VariableV2*
shape: *
shared_name *'
_class
loc:@curiosity_value/bias*
dtype0*
	container 

beta1_power/AssignAssignbeta1_powerbeta1_power/initial_value*
use_locking(*
T0*'
_class
loc:@curiosity_value/bias*
validate_shape(
[
beta1_power/readIdentitybeta1_power*
T0*'
_class
loc:@curiosity_value/bias
o
beta2_power/initial_valueConst*'
_class
loc:@curiosity_value/bias*
valueB
 *w¾?*
dtype0

beta2_power
VariableV2*
shape: *
shared_name *'
_class
loc:@curiosity_value/bias*
dtype0*
	container 

beta2_power/AssignAssignbeta2_powerbeta2_power/initial_value*
use_locking(*
T0*'
_class
loc:@curiosity_value/bias*
validate_shape(
[
beta2_power/readIdentitybeta2_power*
T0*'
_class
loc:@curiosity_value/bias
©
Cmain_graph_0/hidden_0/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
valueB"=     */
_class%
#!loc:@main_graph_0/hidden_0/kernel*
dtype0

9main_graph_0/hidden_0/kernel/Adam/Initializer/zeros/ConstConst*
valueB
 *    */
_class%
#!loc:@main_graph_0/hidden_0/kernel*
dtype0

3main_graph_0/hidden_0/kernel/Adam/Initializer/zerosFillCmain_graph_0/hidden_0/kernel/Adam/Initializer/zeros/shape_as_tensor9main_graph_0/hidden_0/kernel/Adam/Initializer/zeros/Const*
T0*

index_type0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel
Ø
!main_graph_0/hidden_0/kernel/Adam
VariableV2*
shape:
½*
shared_name */
_class%
#!loc:@main_graph_0/hidden_0/kernel*
dtype0*
	container 
ķ
(main_graph_0/hidden_0/kernel/Adam/AssignAssign!main_graph_0/hidden_0/kernel/Adam3main_graph_0/hidden_0/kernel/Adam/Initializer/zeros*
use_locking(*
T0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel*
validate_shape(

&main_graph_0/hidden_0/kernel/Adam/readIdentity!main_graph_0/hidden_0/kernel/Adam*
T0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel
«
Emain_graph_0/hidden_0/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB"=     */
_class%
#!loc:@main_graph_0/hidden_0/kernel*
dtype0

;main_graph_0/hidden_0/kernel/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    */
_class%
#!loc:@main_graph_0/hidden_0/kernel*
dtype0

5main_graph_0/hidden_0/kernel/Adam_1/Initializer/zerosFillEmain_graph_0/hidden_0/kernel/Adam_1/Initializer/zeros/shape_as_tensor;main_graph_0/hidden_0/kernel/Adam_1/Initializer/zeros/Const*
T0*

index_type0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel
Ŗ
#main_graph_0/hidden_0/kernel/Adam_1
VariableV2*
shape:
½*
shared_name */
_class%
#!loc:@main_graph_0/hidden_0/kernel*
dtype0*
	container 
ó
*main_graph_0/hidden_0/kernel/Adam_1/AssignAssign#main_graph_0/hidden_0/kernel/Adam_15main_graph_0/hidden_0/kernel/Adam_1/Initializer/zeros*
use_locking(*
T0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel*
validate_shape(

(main_graph_0/hidden_0/kernel/Adam_1/readIdentity#main_graph_0/hidden_0/kernel/Adam_1*
T0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel

1main_graph_0/hidden_0/bias/Adam/Initializer/zerosConst*
valueB*    *-
_class#
!loc:@main_graph_0/hidden_0/bias*
dtype0

main_graph_0/hidden_0/bias/Adam
VariableV2*
shape:*
shared_name *-
_class#
!loc:@main_graph_0/hidden_0/bias*
dtype0*
	container 
å
&main_graph_0/hidden_0/bias/Adam/AssignAssignmain_graph_0/hidden_0/bias/Adam1main_graph_0/hidden_0/bias/Adam/Initializer/zeros*
use_locking(*
T0*-
_class#
!loc:@main_graph_0/hidden_0/bias*
validate_shape(

$main_graph_0/hidden_0/bias/Adam/readIdentitymain_graph_0/hidden_0/bias/Adam*
T0*-
_class#
!loc:@main_graph_0/hidden_0/bias

3main_graph_0/hidden_0/bias/Adam_1/Initializer/zerosConst*
valueB*    *-
_class#
!loc:@main_graph_0/hidden_0/bias*
dtype0
”
!main_graph_0/hidden_0/bias/Adam_1
VariableV2*
shape:*
shared_name *-
_class#
!loc:@main_graph_0/hidden_0/bias*
dtype0*
	container 
ė
(main_graph_0/hidden_0/bias/Adam_1/AssignAssign!main_graph_0/hidden_0/bias/Adam_13main_graph_0/hidden_0/bias/Adam_1/Initializer/zeros*
use_locking(*
T0*-
_class#
!loc:@main_graph_0/hidden_0/bias*
validate_shape(

&main_graph_0/hidden_0/bias/Adam_1/readIdentity!main_graph_0/hidden_0/bias/Adam_1*
T0*-
_class#
!loc:@main_graph_0/hidden_0/bias
©
Cmain_graph_0/hidden_1/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
valueB"      */
_class%
#!loc:@main_graph_0/hidden_1/kernel*
dtype0

9main_graph_0/hidden_1/kernel/Adam/Initializer/zeros/ConstConst*
valueB
 *    */
_class%
#!loc:@main_graph_0/hidden_1/kernel*
dtype0

3main_graph_0/hidden_1/kernel/Adam/Initializer/zerosFillCmain_graph_0/hidden_1/kernel/Adam/Initializer/zeros/shape_as_tensor9main_graph_0/hidden_1/kernel/Adam/Initializer/zeros/Const*
T0*

index_type0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel
Ø
!main_graph_0/hidden_1/kernel/Adam
VariableV2*
shape:
*
shared_name */
_class%
#!loc:@main_graph_0/hidden_1/kernel*
dtype0*
	container 
ķ
(main_graph_0/hidden_1/kernel/Adam/AssignAssign!main_graph_0/hidden_1/kernel/Adam3main_graph_0/hidden_1/kernel/Adam/Initializer/zeros*
use_locking(*
T0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel*
validate_shape(

&main_graph_0/hidden_1/kernel/Adam/readIdentity!main_graph_0/hidden_1/kernel/Adam*
T0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel
«
Emain_graph_0/hidden_1/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB"      */
_class%
#!loc:@main_graph_0/hidden_1/kernel*
dtype0

;main_graph_0/hidden_1/kernel/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    */
_class%
#!loc:@main_graph_0/hidden_1/kernel*
dtype0

5main_graph_0/hidden_1/kernel/Adam_1/Initializer/zerosFillEmain_graph_0/hidden_1/kernel/Adam_1/Initializer/zeros/shape_as_tensor;main_graph_0/hidden_1/kernel/Adam_1/Initializer/zeros/Const*
T0*

index_type0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel
Ŗ
#main_graph_0/hidden_1/kernel/Adam_1
VariableV2*
shape:
*
shared_name */
_class%
#!loc:@main_graph_0/hidden_1/kernel*
dtype0*
	container 
ó
*main_graph_0/hidden_1/kernel/Adam_1/AssignAssign#main_graph_0/hidden_1/kernel/Adam_15main_graph_0/hidden_1/kernel/Adam_1/Initializer/zeros*
use_locking(*
T0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel*
validate_shape(

(main_graph_0/hidden_1/kernel/Adam_1/readIdentity#main_graph_0/hidden_1/kernel/Adam_1*
T0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel

1main_graph_0/hidden_1/bias/Adam/Initializer/zerosConst*
valueB*    *-
_class#
!loc:@main_graph_0/hidden_1/bias*
dtype0

main_graph_0/hidden_1/bias/Adam
VariableV2*
shape:*
shared_name *-
_class#
!loc:@main_graph_0/hidden_1/bias*
dtype0*
	container 
å
&main_graph_0/hidden_1/bias/Adam/AssignAssignmain_graph_0/hidden_1/bias/Adam1main_graph_0/hidden_1/bias/Adam/Initializer/zeros*
use_locking(*
T0*-
_class#
!loc:@main_graph_0/hidden_1/bias*
validate_shape(

$main_graph_0/hidden_1/bias/Adam/readIdentitymain_graph_0/hidden_1/bias/Adam*
T0*-
_class#
!loc:@main_graph_0/hidden_1/bias

3main_graph_0/hidden_1/bias/Adam_1/Initializer/zerosConst*
valueB*    *-
_class#
!loc:@main_graph_0/hidden_1/bias*
dtype0
”
!main_graph_0/hidden_1/bias/Adam_1
VariableV2*
shape:*
shared_name *-
_class#
!loc:@main_graph_0/hidden_1/bias*
dtype0*
	container 
ė
(main_graph_0/hidden_1/bias/Adam_1/AssignAssign!main_graph_0/hidden_1/bias/Adam_13main_graph_0/hidden_1/bias/Adam_1/Initializer/zeros*
use_locking(*
T0*-
_class#
!loc:@main_graph_0/hidden_1/bias*
validate_shape(

&main_graph_0/hidden_1/bias/Adam_1/readIdentity!main_graph_0/hidden_1/bias/Adam_1*
T0*-
_class#
!loc:@main_graph_0/hidden_1/bias
©
Cmain_graph_0/hidden_2/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
valueB"      */
_class%
#!loc:@main_graph_0/hidden_2/kernel*
dtype0

9main_graph_0/hidden_2/kernel/Adam/Initializer/zeros/ConstConst*
valueB
 *    */
_class%
#!loc:@main_graph_0/hidden_2/kernel*
dtype0

3main_graph_0/hidden_2/kernel/Adam/Initializer/zerosFillCmain_graph_0/hidden_2/kernel/Adam/Initializer/zeros/shape_as_tensor9main_graph_0/hidden_2/kernel/Adam/Initializer/zeros/Const*
T0*

index_type0*/
_class%
#!loc:@main_graph_0/hidden_2/kernel
Ø
!main_graph_0/hidden_2/kernel/Adam
VariableV2*
shape:
*
shared_name */
_class%
#!loc:@main_graph_0/hidden_2/kernel*
dtype0*
	container 
ķ
(main_graph_0/hidden_2/kernel/Adam/AssignAssign!main_graph_0/hidden_2/kernel/Adam3main_graph_0/hidden_2/kernel/Adam/Initializer/zeros*
use_locking(*
T0*/
_class%
#!loc:@main_graph_0/hidden_2/kernel*
validate_shape(

&main_graph_0/hidden_2/kernel/Adam/readIdentity!main_graph_0/hidden_2/kernel/Adam*
T0*/
_class%
#!loc:@main_graph_0/hidden_2/kernel
«
Emain_graph_0/hidden_2/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB"      */
_class%
#!loc:@main_graph_0/hidden_2/kernel*
dtype0

;main_graph_0/hidden_2/kernel/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    */
_class%
#!loc:@main_graph_0/hidden_2/kernel*
dtype0

5main_graph_0/hidden_2/kernel/Adam_1/Initializer/zerosFillEmain_graph_0/hidden_2/kernel/Adam_1/Initializer/zeros/shape_as_tensor;main_graph_0/hidden_2/kernel/Adam_1/Initializer/zeros/Const*
T0*

index_type0*/
_class%
#!loc:@main_graph_0/hidden_2/kernel
Ŗ
#main_graph_0/hidden_2/kernel/Adam_1
VariableV2*
shape:
*
shared_name */
_class%
#!loc:@main_graph_0/hidden_2/kernel*
dtype0*
	container 
ó
*main_graph_0/hidden_2/kernel/Adam_1/AssignAssign#main_graph_0/hidden_2/kernel/Adam_15main_graph_0/hidden_2/kernel/Adam_1/Initializer/zeros*
use_locking(*
T0*/
_class%
#!loc:@main_graph_0/hidden_2/kernel*
validate_shape(

(main_graph_0/hidden_2/kernel/Adam_1/readIdentity#main_graph_0/hidden_2/kernel/Adam_1*
T0*/
_class%
#!loc:@main_graph_0/hidden_2/kernel

1main_graph_0/hidden_2/bias/Adam/Initializer/zerosConst*
valueB*    *-
_class#
!loc:@main_graph_0/hidden_2/bias*
dtype0

main_graph_0/hidden_2/bias/Adam
VariableV2*
shape:*
shared_name *-
_class#
!loc:@main_graph_0/hidden_2/bias*
dtype0*
	container 
å
&main_graph_0/hidden_2/bias/Adam/AssignAssignmain_graph_0/hidden_2/bias/Adam1main_graph_0/hidden_2/bias/Adam/Initializer/zeros*
use_locking(*
T0*-
_class#
!loc:@main_graph_0/hidden_2/bias*
validate_shape(

$main_graph_0/hidden_2/bias/Adam/readIdentitymain_graph_0/hidden_2/bias/Adam*
T0*-
_class#
!loc:@main_graph_0/hidden_2/bias

3main_graph_0/hidden_2/bias/Adam_1/Initializer/zerosConst*
valueB*    *-
_class#
!loc:@main_graph_0/hidden_2/bias*
dtype0
”
!main_graph_0/hidden_2/bias/Adam_1
VariableV2*
shape:*
shared_name *-
_class#
!loc:@main_graph_0/hidden_2/bias*
dtype0*
	container 
ė
(main_graph_0/hidden_2/bias/Adam_1/AssignAssign!main_graph_0/hidden_2/bias/Adam_13main_graph_0/hidden_2/bias/Adam_1/Initializer/zeros*
use_locking(*
T0*-
_class#
!loc:@main_graph_0/hidden_2/bias*
validate_shape(

&main_graph_0/hidden_2/bias/Adam_1/readIdentity!main_graph_0/hidden_2/bias/Adam_1*
T0*-
_class#
!loc:@main_graph_0/hidden_2/bias
©
Cmain_graph_0/hidden_3/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
valueB"      */
_class%
#!loc:@main_graph_0/hidden_3/kernel*
dtype0

9main_graph_0/hidden_3/kernel/Adam/Initializer/zeros/ConstConst*
valueB
 *    */
_class%
#!loc:@main_graph_0/hidden_3/kernel*
dtype0

3main_graph_0/hidden_3/kernel/Adam/Initializer/zerosFillCmain_graph_0/hidden_3/kernel/Adam/Initializer/zeros/shape_as_tensor9main_graph_0/hidden_3/kernel/Adam/Initializer/zeros/Const*
T0*

index_type0*/
_class%
#!loc:@main_graph_0/hidden_3/kernel
Ø
!main_graph_0/hidden_3/kernel/Adam
VariableV2*
shape:
*
shared_name */
_class%
#!loc:@main_graph_0/hidden_3/kernel*
dtype0*
	container 
ķ
(main_graph_0/hidden_3/kernel/Adam/AssignAssign!main_graph_0/hidden_3/kernel/Adam3main_graph_0/hidden_3/kernel/Adam/Initializer/zeros*
use_locking(*
T0*/
_class%
#!loc:@main_graph_0/hidden_3/kernel*
validate_shape(

&main_graph_0/hidden_3/kernel/Adam/readIdentity!main_graph_0/hidden_3/kernel/Adam*
T0*/
_class%
#!loc:@main_graph_0/hidden_3/kernel
«
Emain_graph_0/hidden_3/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB"      */
_class%
#!loc:@main_graph_0/hidden_3/kernel*
dtype0

;main_graph_0/hidden_3/kernel/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    */
_class%
#!loc:@main_graph_0/hidden_3/kernel*
dtype0

5main_graph_0/hidden_3/kernel/Adam_1/Initializer/zerosFillEmain_graph_0/hidden_3/kernel/Adam_1/Initializer/zeros/shape_as_tensor;main_graph_0/hidden_3/kernel/Adam_1/Initializer/zeros/Const*
T0*

index_type0*/
_class%
#!loc:@main_graph_0/hidden_3/kernel
Ŗ
#main_graph_0/hidden_3/kernel/Adam_1
VariableV2*
shape:
*
shared_name */
_class%
#!loc:@main_graph_0/hidden_3/kernel*
dtype0*
	container 
ó
*main_graph_0/hidden_3/kernel/Adam_1/AssignAssign#main_graph_0/hidden_3/kernel/Adam_15main_graph_0/hidden_3/kernel/Adam_1/Initializer/zeros*
use_locking(*
T0*/
_class%
#!loc:@main_graph_0/hidden_3/kernel*
validate_shape(

(main_graph_0/hidden_3/kernel/Adam_1/readIdentity#main_graph_0/hidden_3/kernel/Adam_1*
T0*/
_class%
#!loc:@main_graph_0/hidden_3/kernel

1main_graph_0/hidden_3/bias/Adam/Initializer/zerosConst*
valueB*    *-
_class#
!loc:@main_graph_0/hidden_3/bias*
dtype0

main_graph_0/hidden_3/bias/Adam
VariableV2*
shape:*
shared_name *-
_class#
!loc:@main_graph_0/hidden_3/bias*
dtype0*
	container 
å
&main_graph_0/hidden_3/bias/Adam/AssignAssignmain_graph_0/hidden_3/bias/Adam1main_graph_0/hidden_3/bias/Adam/Initializer/zeros*
use_locking(*
T0*-
_class#
!loc:@main_graph_0/hidden_3/bias*
validate_shape(

$main_graph_0/hidden_3/bias/Adam/readIdentitymain_graph_0/hidden_3/bias/Adam*
T0*-
_class#
!loc:@main_graph_0/hidden_3/bias

3main_graph_0/hidden_3/bias/Adam_1/Initializer/zerosConst*
valueB*    *-
_class#
!loc:@main_graph_0/hidden_3/bias*
dtype0
”
!main_graph_0/hidden_3/bias/Adam_1
VariableV2*
shape:*
shared_name *-
_class#
!loc:@main_graph_0/hidden_3/bias*
dtype0*
	container 
ė
(main_graph_0/hidden_3/bias/Adam_1/AssignAssign!main_graph_0/hidden_3/bias/Adam_13main_graph_0/hidden_3/bias/Adam_1/Initializer/zeros*
use_locking(*
T0*-
_class#
!loc:@main_graph_0/hidden_3/bias*
validate_shape(

&main_graph_0/hidden_3/bias/Adam_1/readIdentity!main_graph_0/hidden_3/bias/Adam_1*
T0*-
_class#
!loc:@main_graph_0/hidden_3/bias

3dense/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
valueB"      *
_class
loc:@dense/kernel*
dtype0
w
)dense/kernel/Adam/Initializer/zeros/ConstConst*
valueB
 *    *
_class
loc:@dense/kernel*
dtype0
Ē
#dense/kernel/Adam/Initializer/zerosFill3dense/kernel/Adam/Initializer/zeros/shape_as_tensor)dense/kernel/Adam/Initializer/zeros/Const*
T0*

index_type0*
_class
loc:@dense/kernel

dense/kernel/Adam
VariableV2*
shape:	*
shared_name *
_class
loc:@dense/kernel*
dtype0*
	container 
­
dense/kernel/Adam/AssignAssigndense/kernel/Adam#dense/kernel/Adam/Initializer/zeros*
use_locking(*
T0*
_class
loc:@dense/kernel*
validate_shape(
_
dense/kernel/Adam/readIdentitydense/kernel/Adam*
T0*
_class
loc:@dense/kernel

5dense/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB"      *
_class
loc:@dense/kernel*
dtype0
y
+dense/kernel/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    *
_class
loc:@dense/kernel*
dtype0
Ķ
%dense/kernel/Adam_1/Initializer/zerosFill5dense/kernel/Adam_1/Initializer/zeros/shape_as_tensor+dense/kernel/Adam_1/Initializer/zeros/Const*
T0*

index_type0*
_class
loc:@dense/kernel

dense/kernel/Adam_1
VariableV2*
shape:	*
shared_name *
_class
loc:@dense/kernel*
dtype0*
	container 
³
dense/kernel/Adam_1/AssignAssigndense/kernel/Adam_1%dense/kernel/Adam_1/Initializer/zeros*
use_locking(*
T0*
_class
loc:@dense/kernel*
validate_shape(
c
dense/kernel/Adam_1/readIdentitydense/kernel/Adam_1*
T0*
_class
loc:@dense/kernel

-extrinsic_value/kernel/Adam/Initializer/zerosConst*
valueB	*    *)
_class
loc:@extrinsic_value/kernel*
dtype0

extrinsic_value/kernel/Adam
VariableV2*
shape:	*
shared_name *)
_class
loc:@extrinsic_value/kernel*
dtype0*
	container 
Õ
"extrinsic_value/kernel/Adam/AssignAssignextrinsic_value/kernel/Adam-extrinsic_value/kernel/Adam/Initializer/zeros*
use_locking(*
T0*)
_class
loc:@extrinsic_value/kernel*
validate_shape(
}
 extrinsic_value/kernel/Adam/readIdentityextrinsic_value/kernel/Adam*
T0*)
_class
loc:@extrinsic_value/kernel

/extrinsic_value/kernel/Adam_1/Initializer/zerosConst*
valueB	*    *)
_class
loc:@extrinsic_value/kernel*
dtype0

extrinsic_value/kernel/Adam_1
VariableV2*
shape:	*
shared_name *)
_class
loc:@extrinsic_value/kernel*
dtype0*
	container 
Ū
$extrinsic_value/kernel/Adam_1/AssignAssignextrinsic_value/kernel/Adam_1/extrinsic_value/kernel/Adam_1/Initializer/zeros*
use_locking(*
T0*)
_class
loc:@extrinsic_value/kernel*
validate_shape(

"extrinsic_value/kernel/Adam_1/readIdentityextrinsic_value/kernel/Adam_1*
T0*)
_class
loc:@extrinsic_value/kernel

+extrinsic_value/bias/Adam/Initializer/zerosConst*
valueB*    *'
_class
loc:@extrinsic_value/bias*
dtype0

extrinsic_value/bias/Adam
VariableV2*
shape:*
shared_name *'
_class
loc:@extrinsic_value/bias*
dtype0*
	container 
Ķ
 extrinsic_value/bias/Adam/AssignAssignextrinsic_value/bias/Adam+extrinsic_value/bias/Adam/Initializer/zeros*
use_locking(*
T0*'
_class
loc:@extrinsic_value/bias*
validate_shape(
w
extrinsic_value/bias/Adam/readIdentityextrinsic_value/bias/Adam*
T0*'
_class
loc:@extrinsic_value/bias

-extrinsic_value/bias/Adam_1/Initializer/zerosConst*
valueB*    *'
_class
loc:@extrinsic_value/bias*
dtype0

extrinsic_value/bias/Adam_1
VariableV2*
shape:*
shared_name *'
_class
loc:@extrinsic_value/bias*
dtype0*
	container 
Ó
"extrinsic_value/bias/Adam_1/AssignAssignextrinsic_value/bias/Adam_1-extrinsic_value/bias/Adam_1/Initializer/zeros*
use_locking(*
T0*'
_class
loc:@extrinsic_value/bias*
validate_shape(
{
 extrinsic_value/bias/Adam_1/readIdentityextrinsic_value/bias/Adam_1*
T0*'
_class
loc:@extrinsic_value/bias

-curiosity_value/kernel/Adam/Initializer/zerosConst*
valueB	*    *)
_class
loc:@curiosity_value/kernel*
dtype0

curiosity_value/kernel/Adam
VariableV2*
shape:	*
shared_name *)
_class
loc:@curiosity_value/kernel*
dtype0*
	container 
Õ
"curiosity_value/kernel/Adam/AssignAssigncuriosity_value/kernel/Adam-curiosity_value/kernel/Adam/Initializer/zeros*
use_locking(*
T0*)
_class
loc:@curiosity_value/kernel*
validate_shape(
}
 curiosity_value/kernel/Adam/readIdentitycuriosity_value/kernel/Adam*
T0*)
_class
loc:@curiosity_value/kernel

/curiosity_value/kernel/Adam_1/Initializer/zerosConst*
valueB	*    *)
_class
loc:@curiosity_value/kernel*
dtype0

curiosity_value/kernel/Adam_1
VariableV2*
shape:	*
shared_name *)
_class
loc:@curiosity_value/kernel*
dtype0*
	container 
Ū
$curiosity_value/kernel/Adam_1/AssignAssigncuriosity_value/kernel/Adam_1/curiosity_value/kernel/Adam_1/Initializer/zeros*
use_locking(*
T0*)
_class
loc:@curiosity_value/kernel*
validate_shape(

"curiosity_value/kernel/Adam_1/readIdentitycuriosity_value/kernel/Adam_1*
T0*)
_class
loc:@curiosity_value/kernel

+curiosity_value/bias/Adam/Initializer/zerosConst*
valueB*    *'
_class
loc:@curiosity_value/bias*
dtype0

curiosity_value/bias/Adam
VariableV2*
shape:*
shared_name *'
_class
loc:@curiosity_value/bias*
dtype0*
	container 
Ķ
 curiosity_value/bias/Adam/AssignAssigncuriosity_value/bias/Adam+curiosity_value/bias/Adam/Initializer/zeros*
use_locking(*
T0*'
_class
loc:@curiosity_value/bias*
validate_shape(
w
curiosity_value/bias/Adam/readIdentitycuriosity_value/bias/Adam*
T0*'
_class
loc:@curiosity_value/bias

-curiosity_value/bias/Adam_1/Initializer/zerosConst*
valueB*    *'
_class
loc:@curiosity_value/bias*
dtype0

curiosity_value/bias/Adam_1
VariableV2*
shape:*
shared_name *'
_class
loc:@curiosity_value/bias*
dtype0*
	container 
Ó
"curiosity_value/bias/Adam_1/AssignAssigncuriosity_value/bias/Adam_1-curiosity_value/bias/Adam_1/Initializer/zeros*
use_locking(*
T0*'
_class
loc:@curiosity_value/bias*
validate_shape(
{
 curiosity_value/bias/Adam_1/readIdentitycuriosity_value/bias/Adam_1*
T0*'
_class
loc:@curiosity_value/bias
7

Adam/beta1Const*
valueB
 *fff?*
dtype0
7

Adam/beta2Const*
valueB
 *w¾?*
dtype0
9
Adam/epsilonConst*
valueB
 *wĢ+2*
dtype0
«
2Adam/update_main_graph_0/hidden_0/kernel/ApplyAdam	ApplyAdammain_graph_0/hidden_0/kernel!main_graph_0/hidden_0/kernel/Adam#main_graph_0/hidden_0/kernel/Adam_1beta1_power/readbeta2_power/readPolynomialDecay
Adam/beta1
Adam/beta2Adam/epsilonHgradients_1/main_graph_0/hidden_0/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel*
use_nesterov( 
¢
0Adam/update_main_graph_0/hidden_0/bias/ApplyAdam	ApplyAdammain_graph_0/hidden_0/biasmain_graph_0/hidden_0/bias/Adam!main_graph_0/hidden_0/bias/Adam_1beta1_power/readbeta2_power/readPolynomialDecay
Adam/beta1
Adam/beta2Adam/epsilonIgradients_1/main_graph_0/hidden_0/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*-
_class#
!loc:@main_graph_0/hidden_0/bias*
use_nesterov( 
«
2Adam/update_main_graph_0/hidden_1/kernel/ApplyAdam	ApplyAdammain_graph_0/hidden_1/kernel!main_graph_0/hidden_1/kernel/Adam#main_graph_0/hidden_1/kernel/Adam_1beta1_power/readbeta2_power/readPolynomialDecay
Adam/beta1
Adam/beta2Adam/epsilonHgradients_1/main_graph_0/hidden_1/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel*
use_nesterov( 
¢
0Adam/update_main_graph_0/hidden_1/bias/ApplyAdam	ApplyAdammain_graph_0/hidden_1/biasmain_graph_0/hidden_1/bias/Adam!main_graph_0/hidden_1/bias/Adam_1beta1_power/readbeta2_power/readPolynomialDecay
Adam/beta1
Adam/beta2Adam/epsilonIgradients_1/main_graph_0/hidden_1/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*-
_class#
!loc:@main_graph_0/hidden_1/bias*
use_nesterov( 
«
2Adam/update_main_graph_0/hidden_2/kernel/ApplyAdam	ApplyAdammain_graph_0/hidden_2/kernel!main_graph_0/hidden_2/kernel/Adam#main_graph_0/hidden_2/kernel/Adam_1beta1_power/readbeta2_power/readPolynomialDecay
Adam/beta1
Adam/beta2Adam/epsilonHgradients_1/main_graph_0/hidden_2/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*/
_class%
#!loc:@main_graph_0/hidden_2/kernel*
use_nesterov( 
¢
0Adam/update_main_graph_0/hidden_2/bias/ApplyAdam	ApplyAdammain_graph_0/hidden_2/biasmain_graph_0/hidden_2/bias/Adam!main_graph_0/hidden_2/bias/Adam_1beta1_power/readbeta2_power/readPolynomialDecay
Adam/beta1
Adam/beta2Adam/epsilonIgradients_1/main_graph_0/hidden_2/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*-
_class#
!loc:@main_graph_0/hidden_2/bias*
use_nesterov( 
«
2Adam/update_main_graph_0/hidden_3/kernel/ApplyAdam	ApplyAdammain_graph_0/hidden_3/kernel!main_graph_0/hidden_3/kernel/Adam#main_graph_0/hidden_3/kernel/Adam_1beta1_power/readbeta2_power/readPolynomialDecay
Adam/beta1
Adam/beta2Adam/epsilonHgradients_1/main_graph_0/hidden_3/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*/
_class%
#!loc:@main_graph_0/hidden_3/kernel*
use_nesterov( 
¢
0Adam/update_main_graph_0/hidden_3/bias/ApplyAdam	ApplyAdammain_graph_0/hidden_3/biasmain_graph_0/hidden_3/bias/Adam!main_graph_0/hidden_3/bias/Adam_1beta1_power/readbeta2_power/readPolynomialDecay
Adam/beta1
Adam/beta2Adam/epsilonIgradients_1/main_graph_0/hidden_3/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*-
_class#
!loc:@main_graph_0/hidden_3/bias*
use_nesterov( 
Ė
"Adam/update_dense/kernel/ApplyAdam	ApplyAdamdense/kerneldense/kernel/Adamdense/kernel/Adam_1beta1_power/readbeta2_power/readPolynomialDecay
Adam/beta1
Adam/beta2Adam/epsilon8gradients_1/dense/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@dense/kernel*
use_nesterov( 

,Adam/update_extrinsic_value/kernel/ApplyAdam	ApplyAdamextrinsic_value/kernelextrinsic_value/kernel/Adamextrinsic_value/kernel/Adam_1beta1_power/readbeta2_power/readPolynomialDecay
Adam/beta1
Adam/beta2Adam/epsilonBgradients_1/extrinsic_value/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*)
_class
loc:@extrinsic_value/kernel*
use_nesterov( 
ž
*Adam/update_extrinsic_value/bias/ApplyAdam	ApplyAdamextrinsic_value/biasextrinsic_value/bias/Adamextrinsic_value/bias/Adam_1beta1_power/readbeta2_power/readPolynomialDecay
Adam/beta1
Adam/beta2Adam/epsilonCgradients_1/extrinsic_value/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*'
_class
loc:@extrinsic_value/bias*
use_nesterov( 

,Adam/update_curiosity_value/kernel/ApplyAdam	ApplyAdamcuriosity_value/kernelcuriosity_value/kernel/Adamcuriosity_value/kernel/Adam_1beta1_power/readbeta2_power/readPolynomialDecay
Adam/beta1
Adam/beta2Adam/epsilonBgradients_1/curiosity_value/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*)
_class
loc:@curiosity_value/kernel*
use_nesterov( 
ž
*Adam/update_curiosity_value/bias/ApplyAdam	ApplyAdamcuriosity_value/biascuriosity_value/bias/Adamcuriosity_value/bias/Adam_1beta1_power/readbeta2_power/readPolynomialDecay
Adam/beta1
Adam/beta2Adam/epsilonCgradients_1/curiosity_value/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*'
_class
loc:@curiosity_value/bias*
use_nesterov( 
Ü
Adam/mulMulbeta1_power/read
Adam/beta1+^Adam/update_curiosity_value/bias/ApplyAdam-^Adam/update_curiosity_value/kernel/ApplyAdam#^Adam/update_dense/kernel/ApplyAdam+^Adam/update_extrinsic_value/bias/ApplyAdam-^Adam/update_extrinsic_value/kernel/ApplyAdam1^Adam/update_main_graph_0/hidden_0/bias/ApplyAdam3^Adam/update_main_graph_0/hidden_0/kernel/ApplyAdam1^Adam/update_main_graph_0/hidden_1/bias/ApplyAdam3^Adam/update_main_graph_0/hidden_1/kernel/ApplyAdam1^Adam/update_main_graph_0/hidden_2/bias/ApplyAdam3^Adam/update_main_graph_0/hidden_2/kernel/ApplyAdam1^Adam/update_main_graph_0/hidden_3/bias/ApplyAdam3^Adam/update_main_graph_0/hidden_3/kernel/ApplyAdam*
T0*'
_class
loc:@curiosity_value/bias

Adam/AssignAssignbeta1_powerAdam/mul*
use_locking( *
T0*'
_class
loc:@curiosity_value/bias*
validate_shape(
Ž

Adam/mul_1Mulbeta2_power/read
Adam/beta2+^Adam/update_curiosity_value/bias/ApplyAdam-^Adam/update_curiosity_value/kernel/ApplyAdam#^Adam/update_dense/kernel/ApplyAdam+^Adam/update_extrinsic_value/bias/ApplyAdam-^Adam/update_extrinsic_value/kernel/ApplyAdam1^Adam/update_main_graph_0/hidden_0/bias/ApplyAdam3^Adam/update_main_graph_0/hidden_0/kernel/ApplyAdam1^Adam/update_main_graph_0/hidden_1/bias/ApplyAdam3^Adam/update_main_graph_0/hidden_1/kernel/ApplyAdam1^Adam/update_main_graph_0/hidden_2/bias/ApplyAdam3^Adam/update_main_graph_0/hidden_2/kernel/ApplyAdam1^Adam/update_main_graph_0/hidden_3/bias/ApplyAdam3^Adam/update_main_graph_0/hidden_3/kernel/ApplyAdam*
T0*'
_class
loc:@curiosity_value/bias

Adam/Assign_1Assignbeta2_power
Adam/mul_1*
use_locking( *
T0*'
_class
loc:@curiosity_value/bias*
validate_shape(
§
AdamNoOp^Adam/Assign^Adam/Assign_1+^Adam/update_curiosity_value/bias/ApplyAdam-^Adam/update_curiosity_value/kernel/ApplyAdam#^Adam/update_dense/kernel/ApplyAdam+^Adam/update_extrinsic_value/bias/ApplyAdam-^Adam/update_extrinsic_value/kernel/ApplyAdam1^Adam/update_main_graph_0/hidden_0/bias/ApplyAdam3^Adam/update_main_graph_0/hidden_0/kernel/ApplyAdam1^Adam/update_main_graph_0/hidden_1/bias/ApplyAdam3^Adam/update_main_graph_0/hidden_1/kernel/ApplyAdam1^Adam/update_main_graph_0/hidden_2/bias/ApplyAdam3^Adam/update_main_graph_0/hidden_2/kernel/ApplyAdam1^Adam/update_main_graph_0/hidden_3/bias/ApplyAdam3^Adam/update_main_graph_0/hidden_3/kernel/ApplyAdam
\
!curiosity_next_vector_observationPlaceholder*
shape:’’’’’’’’’½*
dtype0
Å
Ocuriosity_vector_obs_encoder/hidden_0/kernel/Initializer/truncated_normal/shapeConst*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
valueB"=     *
dtype0
¼
Ncuriosity_vector_obs_encoder/hidden_0/kernel/Initializer/truncated_normal/meanConst*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
valueB
 *    *
dtype0
¾
Pcuriosity_vector_obs_encoder/hidden_0/kernel/Initializer/truncated_normal/stddevConst*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
valueB
 *xB=*
dtype0
Æ
Ycuriosity_vector_obs_encoder/hidden_0/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormalOcuriosity_vector_obs_encoder/hidden_0/kernel/Initializer/truncated_normal/shape*
seed»*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
dtype0*
seed2ś
Ė
Mcuriosity_vector_obs_encoder/hidden_0/kernel/Initializer/truncated_normal/mulMulYcuriosity_vector_obs_encoder/hidden_0/kernel/Initializer/truncated_normal/TruncatedNormalPcuriosity_vector_obs_encoder/hidden_0/kernel/Initializer/truncated_normal/stddev*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel
¹
Icuriosity_vector_obs_encoder/hidden_0/kernel/Initializer/truncated_normalAddMcuriosity_vector_obs_encoder/hidden_0/kernel/Initializer/truncated_normal/mulNcuriosity_vector_obs_encoder/hidden_0/kernel/Initializer/truncated_normal/mean*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel
Ć
,curiosity_vector_obs_encoder/hidden_0/kernel
VariableV2*
shape:
½*
shared_name *?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
dtype0*
	container 
©
3curiosity_vector_obs_encoder/hidden_0/kernel/AssignAssign,curiosity_vector_obs_encoder/hidden_0/kernelIcuriosity_vector_obs_encoder/hidden_0/kernel/Initializer/truncated_normal*
use_locking(*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
validate_shape(
µ
1curiosity_vector_obs_encoder/hidden_0/kernel/readIdentity,curiosity_vector_obs_encoder/hidden_0/kernel*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel
­
<curiosity_vector_obs_encoder/hidden_0/bias/Initializer/zerosConst*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
valueB*    *
dtype0
ŗ
*curiosity_vector_obs_encoder/hidden_0/bias
VariableV2*
shape:*
shared_name *=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
dtype0*
	container 

1curiosity_vector_obs_encoder/hidden_0/bias/AssignAssign*curiosity_vector_obs_encoder/hidden_0/bias<curiosity_vector_obs_encoder/hidden_0/bias/Initializer/zeros*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
validate_shape(
Æ
/curiosity_vector_obs_encoder/hidden_0/bias/readIdentity*curiosity_vector_obs_encoder/hidden_0/bias*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias
¬
,curiosity_vector_obs_encoder/hidden_0/MatMulMatMulvector_observation1curiosity_vector_obs_encoder/hidden_0/kernel/read*
transpose_b( *
T0*
transpose_a( 
·
-curiosity_vector_obs_encoder/hidden_0/BiasAddBiasAdd,curiosity_vector_obs_encoder/hidden_0/MatMul/curiosity_vector_obs_encoder/hidden_0/bias/read*
T0*
data_formatNHWC
p
-curiosity_vector_obs_encoder/hidden_0/SigmoidSigmoid-curiosity_vector_obs_encoder/hidden_0/BiasAdd*
T0

)curiosity_vector_obs_encoder/hidden_0/MulMul-curiosity_vector_obs_encoder/hidden_0/BiasAdd-curiosity_vector_obs_encoder/hidden_0/Sigmoid*
T0
Å
Ocuriosity_vector_obs_encoder/hidden_1/kernel/Initializer/truncated_normal/shapeConst*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
valueB"      *
dtype0
¼
Ncuriosity_vector_obs_encoder/hidden_1/kernel/Initializer/truncated_normal/meanConst*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
valueB
 *    *
dtype0
¾
Pcuriosity_vector_obs_encoder/hidden_1/kernel/Initializer/truncated_normal/stddevConst*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
valueB
 *6=*
dtype0
Æ
Ycuriosity_vector_obs_encoder/hidden_1/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormalOcuriosity_vector_obs_encoder/hidden_1/kernel/Initializer/truncated_normal/shape*
seed»*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
dtype0*
seed2
Ė
Mcuriosity_vector_obs_encoder/hidden_1/kernel/Initializer/truncated_normal/mulMulYcuriosity_vector_obs_encoder/hidden_1/kernel/Initializer/truncated_normal/TruncatedNormalPcuriosity_vector_obs_encoder/hidden_1/kernel/Initializer/truncated_normal/stddev*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel
¹
Icuriosity_vector_obs_encoder/hidden_1/kernel/Initializer/truncated_normalAddMcuriosity_vector_obs_encoder/hidden_1/kernel/Initializer/truncated_normal/mulNcuriosity_vector_obs_encoder/hidden_1/kernel/Initializer/truncated_normal/mean*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel
Ć
,curiosity_vector_obs_encoder/hidden_1/kernel
VariableV2*
shape:
*
shared_name *?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
dtype0*
	container 
©
3curiosity_vector_obs_encoder/hidden_1/kernel/AssignAssign,curiosity_vector_obs_encoder/hidden_1/kernelIcuriosity_vector_obs_encoder/hidden_1/kernel/Initializer/truncated_normal*
use_locking(*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
validate_shape(
µ
1curiosity_vector_obs_encoder/hidden_1/kernel/readIdentity,curiosity_vector_obs_encoder/hidden_1/kernel*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel
­
<curiosity_vector_obs_encoder/hidden_1/bias/Initializer/zerosConst*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias*
valueB*    *
dtype0
ŗ
*curiosity_vector_obs_encoder/hidden_1/bias
VariableV2*
shape:*
shared_name *=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias*
dtype0*
	container 

1curiosity_vector_obs_encoder/hidden_1/bias/AssignAssign*curiosity_vector_obs_encoder/hidden_1/bias<curiosity_vector_obs_encoder/hidden_1/bias/Initializer/zeros*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias*
validate_shape(
Æ
/curiosity_vector_obs_encoder/hidden_1/bias/readIdentity*curiosity_vector_obs_encoder/hidden_1/bias*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias
Ć
,curiosity_vector_obs_encoder/hidden_1/MatMulMatMul)curiosity_vector_obs_encoder/hidden_0/Mul1curiosity_vector_obs_encoder/hidden_1/kernel/read*
transpose_b( *
T0*
transpose_a( 
·
-curiosity_vector_obs_encoder/hidden_1/BiasAddBiasAdd,curiosity_vector_obs_encoder/hidden_1/MatMul/curiosity_vector_obs_encoder/hidden_1/bias/read*
T0*
data_formatNHWC
p
-curiosity_vector_obs_encoder/hidden_1/SigmoidSigmoid-curiosity_vector_obs_encoder/hidden_1/BiasAdd*
T0

)curiosity_vector_obs_encoder/hidden_1/MulMul-curiosity_vector_obs_encoder/hidden_1/BiasAdd-curiosity_vector_obs_encoder/hidden_1/Sigmoid*
T0
½
.curiosity_vector_obs_encoder_1/hidden_0/MatMulMatMul!curiosity_next_vector_observation1curiosity_vector_obs_encoder/hidden_0/kernel/read*
transpose_b( *
T0*
transpose_a( 
»
/curiosity_vector_obs_encoder_1/hidden_0/BiasAddBiasAdd.curiosity_vector_obs_encoder_1/hidden_0/MatMul/curiosity_vector_obs_encoder/hidden_0/bias/read*
T0*
data_formatNHWC
t
/curiosity_vector_obs_encoder_1/hidden_0/SigmoidSigmoid/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd*
T0

+curiosity_vector_obs_encoder_1/hidden_0/MulMul/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd/curiosity_vector_obs_encoder_1/hidden_0/Sigmoid*
T0
Ē
.curiosity_vector_obs_encoder_1/hidden_1/MatMulMatMul+curiosity_vector_obs_encoder_1/hidden_0/Mul1curiosity_vector_obs_encoder/hidden_1/kernel/read*
transpose_b( *
T0*
transpose_a( 
»
/curiosity_vector_obs_encoder_1/hidden_1/BiasAddBiasAdd.curiosity_vector_obs_encoder_1/hidden_1/MatMul/curiosity_vector_obs_encoder/hidden_1/bias/read*
T0*
data_formatNHWC
t
/curiosity_vector_obs_encoder_1/hidden_1/SigmoidSigmoid/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd*
T0

+curiosity_vector_obs_encoder_1/hidden_1/MulMul/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd/curiosity_vector_obs_encoder_1/hidden_1/Sigmoid*
T0
=
concat_7/concat_dimConst*
value	B :*
dtype0
O
concat_7/concatIdentity)curiosity_vector_obs_encoder/hidden_1/Mul*
T0
=
concat_8/concat_dimConst*
value	B :*
dtype0
Q
concat_8/concatIdentity+curiosity_vector_obs_encoder_1/hidden_1/Mul*
T0
7
concat_9/axisConst*
value	B :*
dtype0
c
concat_9ConcatV2concat_7/concatconcat_8/concatconcat_9/axis*

Tidx0*
T0*
N

/dense_1/kernel/Initializer/random_uniform/shapeConst*!
_class
loc:@dense_1/kernel*
valueB"      *
dtype0
}
-dense_1/kernel/Initializer/random_uniform/minConst*!
_class
loc:@dense_1/kernel*
valueB
 *óµ½*
dtype0
}
-dense_1/kernel/Initializer/random_uniform/maxConst*!
_class
loc:@dense_1/kernel*
valueB
 *óµ=*
dtype0
Ķ
7dense_1/kernel/Initializer/random_uniform/RandomUniformRandomUniform/dense_1/kernel/Initializer/random_uniform/shape*
seed»*
T0*!
_class
loc:@dense_1/kernel*
dtype0*
seed2Ŗ
¾
-dense_1/kernel/Initializer/random_uniform/subSub-dense_1/kernel/Initializer/random_uniform/max-dense_1/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_1/kernel
Č
-dense_1/kernel/Initializer/random_uniform/mulMul7dense_1/kernel/Initializer/random_uniform/RandomUniform-dense_1/kernel/Initializer/random_uniform/sub*
T0*!
_class
loc:@dense_1/kernel
ŗ
)dense_1/kernel/Initializer/random_uniformAdd-dense_1/kernel/Initializer/random_uniform/mul-dense_1/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_1/kernel

dense_1/kernel
VariableV2*
shape:
*
shared_name *!
_class
loc:@dense_1/kernel*
dtype0*
	container 
Æ
dense_1/kernel/AssignAssigndense_1/kernel)dense_1/kernel/Initializer/random_uniform*
use_locking(*
T0*!
_class
loc:@dense_1/kernel*
validate_shape(
[
dense_1/kernel/readIdentitydense_1/kernel*
T0*!
_class
loc:@dense_1/kernel
q
dense_1/bias/Initializer/zerosConst*
_class
loc:@dense_1/bias*
valueB*    *
dtype0
~
dense_1/bias
VariableV2*
shape:*
shared_name *
_class
loc:@dense_1/bias*
dtype0*
	container 

dense_1/bias/AssignAssigndense_1/biasdense_1/bias/Initializer/zeros*
use_locking(*
T0*
_class
loc:@dense_1/bias*
validate_shape(
U
dense_1/bias/readIdentitydense_1/bias*
T0*
_class
loc:@dense_1/bias
f
dense_1/MatMulMatMulconcat_9dense_1/kernel/read*
transpose_b( *
T0*
transpose_a( 
]
dense_1/BiasAddBiasAdddense_1/MatMuldense_1/bias/read*
T0*
data_formatNHWC
4
dense_1/SigmoidSigmoiddense_1/BiasAdd*
T0
=
dense_1/MulMuldense_1/BiasAdddense_1/Sigmoid*
T0

/dense_2/kernel/Initializer/random_uniform/shapeConst*!
_class
loc:@dense_2/kernel*
valueB"      *
dtype0
}
-dense_2/kernel/Initializer/random_uniform/minConst*!
_class
loc:@dense_2/kernel*
valueB
 *ĀŖ¾*
dtype0
}
-dense_2/kernel/Initializer/random_uniform/maxConst*!
_class
loc:@dense_2/kernel*
valueB
 *ĀŖ>*
dtype0
Ķ
7dense_2/kernel/Initializer/random_uniform/RandomUniformRandomUniform/dense_2/kernel/Initializer/random_uniform/shape*
seed»*
T0*!
_class
loc:@dense_2/kernel*
dtype0*
seed2¼
¾
-dense_2/kernel/Initializer/random_uniform/subSub-dense_2/kernel/Initializer/random_uniform/max-dense_2/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_2/kernel
Č
-dense_2/kernel/Initializer/random_uniform/mulMul7dense_2/kernel/Initializer/random_uniform/RandomUniform-dense_2/kernel/Initializer/random_uniform/sub*
T0*!
_class
loc:@dense_2/kernel
ŗ
)dense_2/kernel/Initializer/random_uniformAdd-dense_2/kernel/Initializer/random_uniform/mul-dense_2/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_2/kernel

dense_2/kernel
VariableV2*
shape:	*
shared_name *!
_class
loc:@dense_2/kernel*
dtype0*
	container 
Æ
dense_2/kernel/AssignAssigndense_2/kernel)dense_2/kernel/Initializer/random_uniform*
use_locking(*
T0*!
_class
loc:@dense_2/kernel*
validate_shape(
[
dense_2/kernel/readIdentitydense_2/kernel*
T0*!
_class
loc:@dense_2/kernel
p
dense_2/bias/Initializer/zerosConst*
_class
loc:@dense_2/bias*
valueB*    *
dtype0
}
dense_2/bias
VariableV2*
shape:*
shared_name *
_class
loc:@dense_2/bias*
dtype0*
	container 

dense_2/bias/AssignAssigndense_2/biasdense_2/bias/Initializer/zeros*
use_locking(*
T0*
_class
loc:@dense_2/bias*
validate_shape(
U
dense_2/bias/readIdentitydense_2/bias*
T0*
_class
loc:@dense_2/bias
i
dense_2/MatMulMatMuldense_1/Muldense_2/kernel/read*
transpose_b( *
T0*
transpose_a( 
]
dense_2/BiasAddBiasAdddense_2/MatMuldense_2/bias/read*
T0*
data_formatNHWC
4
dense_2/SoftmaxSoftmaxdense_2/BiasAdd*
T0
>
concat_10/concat_dimConst*
value	B :*
dtype0
6
concat_10/concatIdentitydense_2/Softmax*
T0
5
add_16/yConst*
valueB
 *’ęŪ.*
dtype0
4
add_16AddV2concat_10/concatadd_16/y*
T0

Log_4Logadd_16*
T0

Neg_5NegLog_4*
T0
*
mul_7MulNeg_5StopGradient*
T0
A
Sum_9/reduction_indicesConst*
value	B :*
dtype0
R
Sum_9Summul_7Sum_9/reduction_indices*

Tidx0*
	keep_dims( *
T0
R
DynamicPartition_4DynamicPartitionSum_9Cast*
num_partitions*
T0
5
Const_4Const*
valueB: *
dtype0
S
Mean_7MeanDynamicPartition_4:1Const_4*

Tidx0*
	keep_dims( *
T0
8
concat_11/axisConst*
value	B :*
dtype0
b
	concat_11ConcatV2concat_7/concatStopGradientconcat_11/axis*

Tidx0*
T0*
N

/dense_3/kernel/Initializer/random_uniform/shapeConst*!
_class
loc:@dense_3/kernel*
valueB"     *
dtype0
}
-dense_3/kernel/Initializer/random_uniform/minConst*!
_class
loc:@dense_3/kernel*
valueB
 *Ģ3Ü½*
dtype0
}
-dense_3/kernel/Initializer/random_uniform/maxConst*!
_class
loc:@dense_3/kernel*
valueB
 *Ģ3Ü=*
dtype0
Ķ
7dense_3/kernel/Initializer/random_uniform/RandomUniformRandomUniform/dense_3/kernel/Initializer/random_uniform/shape*
seed»*
T0*!
_class
loc:@dense_3/kernel*
dtype0*
seed2Ū
¾
-dense_3/kernel/Initializer/random_uniform/subSub-dense_3/kernel/Initializer/random_uniform/max-dense_3/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_3/kernel
Č
-dense_3/kernel/Initializer/random_uniform/mulMul7dense_3/kernel/Initializer/random_uniform/RandomUniform-dense_3/kernel/Initializer/random_uniform/sub*
T0*!
_class
loc:@dense_3/kernel
ŗ
)dense_3/kernel/Initializer/random_uniformAdd-dense_3/kernel/Initializer/random_uniform/mul-dense_3/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_3/kernel

dense_3/kernel
VariableV2*
shape:
*
shared_name *!
_class
loc:@dense_3/kernel*
dtype0*
	container 
Æ
dense_3/kernel/AssignAssigndense_3/kernel)dense_3/kernel/Initializer/random_uniform*
use_locking(*
T0*!
_class
loc:@dense_3/kernel*
validate_shape(
[
dense_3/kernel/readIdentitydense_3/kernel*
T0*!
_class
loc:@dense_3/kernel
q
dense_3/bias/Initializer/zerosConst*
_class
loc:@dense_3/bias*
valueB*    *
dtype0
~
dense_3/bias
VariableV2*
shape:*
shared_name *
_class
loc:@dense_3/bias*
dtype0*
	container 

dense_3/bias/AssignAssigndense_3/biasdense_3/bias/Initializer/zeros*
use_locking(*
T0*
_class
loc:@dense_3/bias*
validate_shape(
U
dense_3/bias/readIdentitydense_3/bias*
T0*
_class
loc:@dense_3/bias
g
dense_3/MatMulMatMul	concat_11dense_3/kernel/read*
transpose_b( *
T0*
transpose_a( 
]
dense_3/BiasAddBiasAdddense_3/MatMuldense_3/bias/read*
T0*
data_formatNHWC
4
dense_3/SigmoidSigmoiddense_3/BiasAdd*
T0
=
dense_3/MulMuldense_3/BiasAdddense_3/Sigmoid*
T0

/dense_4/kernel/Initializer/random_uniform/shapeConst*!
_class
loc:@dense_4/kernel*
valueB"      *
dtype0
}
-dense_4/kernel/Initializer/random_uniform/minConst*!
_class
loc:@dense_4/kernel*
valueB
 *×³Ż½*
dtype0
}
-dense_4/kernel/Initializer/random_uniform/maxConst*!
_class
loc:@dense_4/kernel*
valueB
 *×³Ż=*
dtype0
Ķ
7dense_4/kernel/Initializer/random_uniform/RandomUniformRandomUniform/dense_4/kernel/Initializer/random_uniform/shape*
seed»*
T0*!
_class
loc:@dense_4/kernel*
dtype0*
seed2ķ
¾
-dense_4/kernel/Initializer/random_uniform/subSub-dense_4/kernel/Initializer/random_uniform/max-dense_4/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_4/kernel
Č
-dense_4/kernel/Initializer/random_uniform/mulMul7dense_4/kernel/Initializer/random_uniform/RandomUniform-dense_4/kernel/Initializer/random_uniform/sub*
T0*!
_class
loc:@dense_4/kernel
ŗ
)dense_4/kernel/Initializer/random_uniformAdd-dense_4/kernel/Initializer/random_uniform/mul-dense_4/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_4/kernel

dense_4/kernel
VariableV2*
shape:
*
shared_name *!
_class
loc:@dense_4/kernel*
dtype0*
	container 
Æ
dense_4/kernel/AssignAssigndense_4/kernel)dense_4/kernel/Initializer/random_uniform*
use_locking(*
T0*!
_class
loc:@dense_4/kernel*
validate_shape(
[
dense_4/kernel/readIdentitydense_4/kernel*
T0*!
_class
loc:@dense_4/kernel
q
dense_4/bias/Initializer/zerosConst*
_class
loc:@dense_4/bias*
valueB*    *
dtype0
~
dense_4/bias
VariableV2*
shape:*
shared_name *
_class
loc:@dense_4/bias*
dtype0*
	container 

dense_4/bias/AssignAssigndense_4/biasdense_4/bias/Initializer/zeros*
use_locking(*
T0*
_class
loc:@dense_4/bias*
validate_shape(
U
dense_4/bias/readIdentitydense_4/bias*
T0*
_class
loc:@dense_4/bias
i
dense_4/MatMulMatMuldense_3/Muldense_4/kernel/read*
transpose_b( *
T0*
transpose_a( 
]
dense_4/BiasAddBiasAdddense_4/MatMuldense_4/bias/read*
T0*
data_formatNHWC
S
SquaredDifference_4SquaredDifferencedense_4/BiasAddconcat_8/concat*
T0
B
Sum_10/reduction_indicesConst*
value	B :*
dtype0
b
Sum_10SumSquaredDifference_4Sum_10/reduction_indices*

Tidx0*
	keep_dims( *
T0
4
mul_8/xConst*
valueB
 *   ?*
dtype0
&
mul_8Mulmul_8/xSum_10*
T0
R
DynamicPartition_5DynamicPartitionmul_8Cast*
num_partitions*
T0
5
Const_5Const*
valueB: *
dtype0
S
Mean_8MeanDynamicPartition_5:1Const_5*

Tidx0*
	keep_dims( *
T0
4
mul_9/xConst*
valueB
 *ĶĢL>*
dtype0
&
mul_9Mulmul_9/xMean_8*
T0
5
mul_10/xConst*
valueB
 *ĶĢL?*
dtype0
(
mul_10Mulmul_10/xMean_7*
T0
'
add_17AddV2mul_9mul_10*
T0
5
mul_11/xConst*
valueB
 *   A*
dtype0
(
mul_11Mulmul_11/xadd_17*
T0
:
gradients_2/ShapeConst*
valueB *
dtype0
B
gradients_2/grad_ys_0Const*
valueB
 *  ?*
dtype0
]
gradients_2/FillFillgradients_2/Shapegradients_2/grad_ys_0*
T0*

index_type0
E
gradients_2/mul_11_grad/MulMulgradients_2/Filladd_17*
T0
I
gradients_2/mul_11_grad/Mul_1Mulgradients_2/Fillmul_11/x*
T0
n
(gradients_2/mul_11_grad/tuple/group_depsNoOp^gradients_2/mul_11_grad/Mul^gradients_2/mul_11_grad/Mul_1
½
0gradients_2/mul_11_grad/tuple/control_dependencyIdentitygradients_2/mul_11_grad/Mul)^gradients_2/mul_11_grad/tuple/group_deps*
T0*.
_class$
" loc:@gradients_2/mul_11_grad/Mul
Ć
2gradients_2/mul_11_grad/tuple/control_dependency_1Identitygradients_2/mul_11_grad/Mul_1)^gradients_2/mul_11_grad/tuple/group_deps*
T0*0
_class&
$"loc:@gradients_2/mul_11_grad/Mul_1
e
(gradients_2/add_17_grad/tuple/group_depsNoOp3^gradients_2/mul_11_grad/tuple/control_dependency_1
Ö
0gradients_2/add_17_grad/tuple/control_dependencyIdentity2gradients_2/mul_11_grad/tuple/control_dependency_1)^gradients_2/add_17_grad/tuple/group_deps*
T0*0
_class&
$"loc:@gradients_2/mul_11_grad/Mul_1
Ų
2gradients_2/add_17_grad/tuple/control_dependency_1Identity2gradients_2/mul_11_grad/tuple/control_dependency_1)^gradients_2/add_17_grad/tuple/group_deps*
T0*0
_class&
$"loc:@gradients_2/mul_11_grad/Mul_1
d
gradients_2/mul_9_grad/MulMul0gradients_2/add_17_grad/tuple/control_dependencyMean_8*
T0
g
gradients_2/mul_9_grad/Mul_1Mul0gradients_2/add_17_grad/tuple/control_dependencymul_9/x*
T0
k
'gradients_2/mul_9_grad/tuple/group_depsNoOp^gradients_2/mul_9_grad/Mul^gradients_2/mul_9_grad/Mul_1
¹
/gradients_2/mul_9_grad/tuple/control_dependencyIdentitygradients_2/mul_9_grad/Mul(^gradients_2/mul_9_grad/tuple/group_deps*
T0*-
_class#
!loc:@gradients_2/mul_9_grad/Mul
æ
1gradients_2/mul_9_grad/tuple/control_dependency_1Identitygradients_2/mul_9_grad/Mul_1(^gradients_2/mul_9_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients_2/mul_9_grad/Mul_1
g
gradients_2/mul_10_grad/MulMul2gradients_2/add_17_grad/tuple/control_dependency_1Mean_7*
T0
k
gradients_2/mul_10_grad/Mul_1Mul2gradients_2/add_17_grad/tuple/control_dependency_1mul_10/x*
T0
n
(gradients_2/mul_10_grad/tuple/group_depsNoOp^gradients_2/mul_10_grad/Mul^gradients_2/mul_10_grad/Mul_1
½
0gradients_2/mul_10_grad/tuple/control_dependencyIdentitygradients_2/mul_10_grad/Mul)^gradients_2/mul_10_grad/tuple/group_deps*
T0*.
_class$
" loc:@gradients_2/mul_10_grad/Mul
Ć
2gradients_2/mul_10_grad/tuple/control_dependency_1Identitygradients_2/mul_10_grad/Mul_1)^gradients_2/mul_10_grad/tuple/group_deps*
T0*0
_class&
$"loc:@gradients_2/mul_10_grad/Mul_1
S
%gradients_2/Mean_8_grad/Reshape/shapeConst*
valueB:*
dtype0

gradients_2/Mean_8_grad/ReshapeReshape1gradients_2/mul_9_grad/tuple/control_dependency_1%gradients_2/Mean_8_grad/Reshape/shape*
T0*
Tshape0
U
gradients_2/Mean_8_grad/ShapeShapeDynamicPartition_5:1*
T0*
out_type0

gradients_2/Mean_8_grad/TileTilegradients_2/Mean_8_grad/Reshapegradients_2/Mean_8_grad/Shape*

Tmultiples0*
T0
W
gradients_2/Mean_8_grad/Shape_1ShapeDynamicPartition_5:1*
T0*
out_type0
H
gradients_2/Mean_8_grad/Shape_2Const*
valueB *
dtype0
K
gradients_2/Mean_8_grad/ConstConst*
valueB: *
dtype0

gradients_2/Mean_8_grad/ProdProdgradients_2/Mean_8_grad/Shape_1gradients_2/Mean_8_grad/Const*

Tidx0*
	keep_dims( *
T0
M
gradients_2/Mean_8_grad/Const_1Const*
valueB: *
dtype0

gradients_2/Mean_8_grad/Prod_1Prodgradients_2/Mean_8_grad/Shape_2gradients_2/Mean_8_grad/Const_1*

Tidx0*
	keep_dims( *
T0
K
!gradients_2/Mean_8_grad/Maximum/yConst*
value	B :*
dtype0
v
gradients_2/Mean_8_grad/MaximumMaximumgradients_2/Mean_8_grad/Prod_1!gradients_2/Mean_8_grad/Maximum/y*
T0
t
 gradients_2/Mean_8_grad/floordivFloorDivgradients_2/Mean_8_grad/Prodgradients_2/Mean_8_grad/Maximum*
T0
n
gradients_2/Mean_8_grad/CastCast gradients_2/Mean_8_grad/floordiv*

SrcT0*
Truncate( *

DstT0
o
gradients_2/Mean_8_grad/truedivRealDivgradients_2/Mean_8_grad/Tilegradients_2/Mean_8_grad/Cast*
T0
S
%gradients_2/Mean_7_grad/Reshape/shapeConst*
valueB:*
dtype0

gradients_2/Mean_7_grad/ReshapeReshape2gradients_2/mul_10_grad/tuple/control_dependency_1%gradients_2/Mean_7_grad/Reshape/shape*
T0*
Tshape0
U
gradients_2/Mean_7_grad/ShapeShapeDynamicPartition_4:1*
T0*
out_type0

gradients_2/Mean_7_grad/TileTilegradients_2/Mean_7_grad/Reshapegradients_2/Mean_7_grad/Shape*

Tmultiples0*
T0
W
gradients_2/Mean_7_grad/Shape_1ShapeDynamicPartition_4:1*
T0*
out_type0
H
gradients_2/Mean_7_grad/Shape_2Const*
valueB *
dtype0
K
gradients_2/Mean_7_grad/ConstConst*
valueB: *
dtype0

gradients_2/Mean_7_grad/ProdProdgradients_2/Mean_7_grad/Shape_1gradients_2/Mean_7_grad/Const*

Tidx0*
	keep_dims( *
T0
M
gradients_2/Mean_7_grad/Const_1Const*
valueB: *
dtype0

gradients_2/Mean_7_grad/Prod_1Prodgradients_2/Mean_7_grad/Shape_2gradients_2/Mean_7_grad/Const_1*

Tidx0*
	keep_dims( *
T0
K
!gradients_2/Mean_7_grad/Maximum/yConst*
value	B :*
dtype0
v
gradients_2/Mean_7_grad/MaximumMaximumgradients_2/Mean_7_grad/Prod_1!gradients_2/Mean_7_grad/Maximum/y*
T0
t
 gradients_2/Mean_7_grad/floordivFloorDivgradients_2/Mean_7_grad/Prodgradients_2/Mean_7_grad/Maximum*
T0
n
gradients_2/Mean_7_grad/CastCast gradients_2/Mean_7_grad/floordiv*

SrcT0*
Truncate( *

DstT0
o
gradients_2/Mean_7_grad/truedivRealDivgradients_2/Mean_7_grad/Tilegradients_2/Mean_7_grad/Cast*
T0
@
gradients_2/zeros_like	ZerosLikeDynamicPartition_5*
T0
Q
)gradients_2/DynamicPartition_5_grad/ShapeShapeCast*
T0*
out_type0
W
)gradients_2/DynamicPartition_5_grad/ConstConst*
valueB: *
dtype0
¬
(gradients_2/DynamicPartition_5_grad/ProdProd)gradients_2/DynamicPartition_5_grad/Shape)gradients_2/DynamicPartition_5_grad/Const*

Tidx0*
	keep_dims( *
T0
Y
/gradients_2/DynamicPartition_5_grad/range/startConst*
value	B : *
dtype0
Y
/gradients_2/DynamicPartition_5_grad/range/deltaConst*
value	B :*
dtype0
Ź
)gradients_2/DynamicPartition_5_grad/rangeRange/gradients_2/DynamicPartition_5_grad/range/start(gradients_2/DynamicPartition_5_grad/Prod/gradients_2/DynamicPartition_5_grad/range/delta*

Tidx0
£
+gradients_2/DynamicPartition_5_grad/ReshapeReshape)gradients_2/DynamicPartition_5_grad/range)gradients_2/DynamicPartition_5_grad/Shape*
T0*
Tshape0

4gradients_2/DynamicPartition_5_grad/DynamicPartitionDynamicPartition+gradients_2/DynamicPartition_5_grad/ReshapeCast*
num_partitions*
T0
ū
1gradients_2/DynamicPartition_5_grad/DynamicStitchDynamicStitch4gradients_2/DynamicPartition_5_grad/DynamicPartition6gradients_2/DynamicPartition_5_grad/DynamicPartition:1gradients_2/zeros_likegradients_2/Mean_8_grad/truediv*
T0*
N
T
+gradients_2/DynamicPartition_5_grad/Shape_1Shapemul_8*
T0*
out_type0
Æ
-gradients_2/DynamicPartition_5_grad/Reshape_1Reshape1gradients_2/DynamicPartition_5_grad/DynamicStitch+gradients_2/DynamicPartition_5_grad/Shape_1*
T0*
Tshape0
B
gradients_2/zeros_like_1	ZerosLikeDynamicPartition_4*
T0
Q
)gradients_2/DynamicPartition_4_grad/ShapeShapeCast*
T0*
out_type0
W
)gradients_2/DynamicPartition_4_grad/ConstConst*
valueB: *
dtype0
¬
(gradients_2/DynamicPartition_4_grad/ProdProd)gradients_2/DynamicPartition_4_grad/Shape)gradients_2/DynamicPartition_4_grad/Const*

Tidx0*
	keep_dims( *
T0
Y
/gradients_2/DynamicPartition_4_grad/range/startConst*
value	B : *
dtype0
Y
/gradients_2/DynamicPartition_4_grad/range/deltaConst*
value	B :*
dtype0
Ź
)gradients_2/DynamicPartition_4_grad/rangeRange/gradients_2/DynamicPartition_4_grad/range/start(gradients_2/DynamicPartition_4_grad/Prod/gradients_2/DynamicPartition_4_grad/range/delta*

Tidx0
£
+gradients_2/DynamicPartition_4_grad/ReshapeReshape)gradients_2/DynamicPartition_4_grad/range)gradients_2/DynamicPartition_4_grad/Shape*
T0*
Tshape0

4gradients_2/DynamicPartition_4_grad/DynamicPartitionDynamicPartition+gradients_2/DynamicPartition_4_grad/ReshapeCast*
num_partitions*
T0
ż
1gradients_2/DynamicPartition_4_grad/DynamicStitchDynamicStitch4gradients_2/DynamicPartition_4_grad/DynamicPartition6gradients_2/DynamicPartition_4_grad/DynamicPartition:1gradients_2/zeros_like_1gradients_2/Mean_7_grad/truediv*
T0*
N
T
+gradients_2/DynamicPartition_4_grad/Shape_1ShapeSum_9*
T0*
out_type0
Æ
-gradients_2/DynamicPartition_4_grad/Reshape_1Reshape1gradients_2/DynamicPartition_4_grad/DynamicStitch+gradients_2/DynamicPartition_4_grad/Shape_1*
T0*
Tshape0
G
gradients_2/mul_8_grad/ShapeShapemul_8/x*
T0*
out_type0
H
gradients_2/mul_8_grad/Shape_1ShapeSum_10*
T0*
out_type0

,gradients_2/mul_8_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_2/mul_8_grad/Shapegradients_2/mul_8_grad/Shape_1*
T0
a
gradients_2/mul_8_grad/MulMul-gradients_2/DynamicPartition_5_grad/Reshape_1Sum_10*
T0

gradients_2/mul_8_grad/SumSumgradients_2/mul_8_grad/Mul,gradients_2/mul_8_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
z
gradients_2/mul_8_grad/ReshapeReshapegradients_2/mul_8_grad/Sumgradients_2/mul_8_grad/Shape*
T0*
Tshape0
d
gradients_2/mul_8_grad/Mul_1Mulmul_8/x-gradients_2/DynamicPartition_5_grad/Reshape_1*
T0

gradients_2/mul_8_grad/Sum_1Sumgradients_2/mul_8_grad/Mul_1.gradients_2/mul_8_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0

 gradients_2/mul_8_grad/Reshape_1Reshapegradients_2/mul_8_grad/Sum_1gradients_2/mul_8_grad/Shape_1*
T0*
Tshape0
s
'gradients_2/mul_8_grad/tuple/group_depsNoOp^gradients_2/mul_8_grad/Reshape!^gradients_2/mul_8_grad/Reshape_1
Į
/gradients_2/mul_8_grad/tuple/control_dependencyIdentitygradients_2/mul_8_grad/Reshape(^gradients_2/mul_8_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_2/mul_8_grad/Reshape
Ē
1gradients_2/mul_8_grad/tuple/control_dependency_1Identity gradients_2/mul_8_grad/Reshape_1(^gradients_2/mul_8_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_2/mul_8_grad/Reshape_1
E
gradients_2/Sum_9_grad/ShapeShapemul_7*
T0*
out_type0
v
gradients_2/Sum_9_grad/SizeConst*/
_class%
#!loc:@gradients_2/Sum_9_grad/Shape*
value	B :*
dtype0

gradients_2/Sum_9_grad/addAddV2Sum_9/reduction_indicesgradients_2/Sum_9_grad/Size*
T0*/
_class%
#!loc:@gradients_2/Sum_9_grad/Shape

gradients_2/Sum_9_grad/modFloorModgradients_2/Sum_9_grad/addgradients_2/Sum_9_grad/Size*
T0*/
_class%
#!loc:@gradients_2/Sum_9_grad/Shape
x
gradients_2/Sum_9_grad/Shape_1Const*/
_class%
#!loc:@gradients_2/Sum_9_grad/Shape*
valueB *
dtype0
}
"gradients_2/Sum_9_grad/range/startConst*/
_class%
#!loc:@gradients_2/Sum_9_grad/Shape*
value	B : *
dtype0
}
"gradients_2/Sum_9_grad/range/deltaConst*/
_class%
#!loc:@gradients_2/Sum_9_grad/Shape*
value	B :*
dtype0
Ē
gradients_2/Sum_9_grad/rangeRange"gradients_2/Sum_9_grad/range/startgradients_2/Sum_9_grad/Size"gradients_2/Sum_9_grad/range/delta*

Tidx0*/
_class%
#!loc:@gradients_2/Sum_9_grad/Shape
|
!gradients_2/Sum_9_grad/Fill/valueConst*/
_class%
#!loc:@gradients_2/Sum_9_grad/Shape*
value	B :*
dtype0
²
gradients_2/Sum_9_grad/FillFillgradients_2/Sum_9_grad/Shape_1!gradients_2/Sum_9_grad/Fill/value*
T0*/
_class%
#!loc:@gradients_2/Sum_9_grad/Shape*

index_type0
ķ
$gradients_2/Sum_9_grad/DynamicStitchDynamicStitchgradients_2/Sum_9_grad/rangegradients_2/Sum_9_grad/modgradients_2/Sum_9_grad/Shapegradients_2/Sum_9_grad/Fill*
T0*/
_class%
#!loc:@gradients_2/Sum_9_grad/Shape*
N
{
 gradients_2/Sum_9_grad/Maximum/yConst*/
_class%
#!loc:@gradients_2/Sum_9_grad/Shape*
value	B :*
dtype0
«
gradients_2/Sum_9_grad/MaximumMaximum$gradients_2/Sum_9_grad/DynamicStitch gradients_2/Sum_9_grad/Maximum/y*
T0*/
_class%
#!loc:@gradients_2/Sum_9_grad/Shape
£
gradients_2/Sum_9_grad/floordivFloorDivgradients_2/Sum_9_grad/Shapegradients_2/Sum_9_grad/Maximum*
T0*/
_class%
#!loc:@gradients_2/Sum_9_grad/Shape

gradients_2/Sum_9_grad/ReshapeReshape-gradients_2/DynamicPartition_4_grad/Reshape_1$gradients_2/Sum_9_grad/DynamicStitch*
T0*
Tshape0

gradients_2/Sum_9_grad/TileTilegradients_2/Sum_9_grad/Reshapegradients_2/Sum_9_grad/floordiv*

Tmultiples0*
T0
T
gradients_2/Sum_10_grad/ShapeShapeSquaredDifference_4*
T0*
out_type0
x
gradients_2/Sum_10_grad/SizeConst*0
_class&
$"loc:@gradients_2/Sum_10_grad/Shape*
value	B :*
dtype0

gradients_2/Sum_10_grad/addAddV2Sum_10/reduction_indicesgradients_2/Sum_10_grad/Size*
T0*0
_class&
$"loc:@gradients_2/Sum_10_grad/Shape

gradients_2/Sum_10_grad/modFloorModgradients_2/Sum_10_grad/addgradients_2/Sum_10_grad/Size*
T0*0
_class&
$"loc:@gradients_2/Sum_10_grad/Shape
z
gradients_2/Sum_10_grad/Shape_1Const*0
_class&
$"loc:@gradients_2/Sum_10_grad/Shape*
valueB *
dtype0

#gradients_2/Sum_10_grad/range/startConst*0
_class&
$"loc:@gradients_2/Sum_10_grad/Shape*
value	B : *
dtype0

#gradients_2/Sum_10_grad/range/deltaConst*0
_class&
$"loc:@gradients_2/Sum_10_grad/Shape*
value	B :*
dtype0
Ģ
gradients_2/Sum_10_grad/rangeRange#gradients_2/Sum_10_grad/range/startgradients_2/Sum_10_grad/Size#gradients_2/Sum_10_grad/range/delta*

Tidx0*0
_class&
$"loc:@gradients_2/Sum_10_grad/Shape
~
"gradients_2/Sum_10_grad/Fill/valueConst*0
_class&
$"loc:@gradients_2/Sum_10_grad/Shape*
value	B :*
dtype0
¶
gradients_2/Sum_10_grad/FillFillgradients_2/Sum_10_grad/Shape_1"gradients_2/Sum_10_grad/Fill/value*
T0*0
_class&
$"loc:@gradients_2/Sum_10_grad/Shape*

index_type0
ó
%gradients_2/Sum_10_grad/DynamicStitchDynamicStitchgradients_2/Sum_10_grad/rangegradients_2/Sum_10_grad/modgradients_2/Sum_10_grad/Shapegradients_2/Sum_10_grad/Fill*
T0*0
_class&
$"loc:@gradients_2/Sum_10_grad/Shape*
N
}
!gradients_2/Sum_10_grad/Maximum/yConst*0
_class&
$"loc:@gradients_2/Sum_10_grad/Shape*
value	B :*
dtype0
Æ
gradients_2/Sum_10_grad/MaximumMaximum%gradients_2/Sum_10_grad/DynamicStitch!gradients_2/Sum_10_grad/Maximum/y*
T0*0
_class&
$"loc:@gradients_2/Sum_10_grad/Shape
§
 gradients_2/Sum_10_grad/floordivFloorDivgradients_2/Sum_10_grad/Shapegradients_2/Sum_10_grad/Maximum*
T0*0
_class&
$"loc:@gradients_2/Sum_10_grad/Shape

gradients_2/Sum_10_grad/ReshapeReshape1gradients_2/mul_8_grad/tuple/control_dependency_1%gradients_2/Sum_10_grad/DynamicStitch*
T0*
Tshape0

gradients_2/Sum_10_grad/TileTilegradients_2/Sum_10_grad/Reshape gradients_2/Sum_10_grad/floordiv*

Tmultiples0*
T0
E
gradients_2/mul_7_grad/ShapeShapeNeg_5*
T0*
out_type0
N
gradients_2/mul_7_grad/Shape_1ShapeStopGradient*
T0*
out_type0

,gradients_2/mul_7_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_2/mul_7_grad/Shapegradients_2/mul_7_grad/Shape_1*
T0
U
gradients_2/mul_7_grad/MulMulgradients_2/Sum_9_grad/TileStopGradient*
T0

gradients_2/mul_7_grad/SumSumgradients_2/mul_7_grad/Mul,gradients_2/mul_7_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
z
gradients_2/mul_7_grad/ReshapeReshapegradients_2/mul_7_grad/Sumgradients_2/mul_7_grad/Shape*
T0*
Tshape0
P
gradients_2/mul_7_grad/Mul_1MulNeg_5gradients_2/Sum_9_grad/Tile*
T0

gradients_2/mul_7_grad/Sum_1Sumgradients_2/mul_7_grad/Mul_1.gradients_2/mul_7_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0

 gradients_2/mul_7_grad/Reshape_1Reshapegradients_2/mul_7_grad/Sum_1gradients_2/mul_7_grad/Shape_1*
T0*
Tshape0
s
'gradients_2/mul_7_grad/tuple/group_depsNoOp^gradients_2/mul_7_grad/Reshape!^gradients_2/mul_7_grad/Reshape_1
Į
/gradients_2/mul_7_grad/tuple/control_dependencyIdentitygradients_2/mul_7_grad/Reshape(^gradients_2/mul_7_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_2/mul_7_grad/Reshape
Ē
1gradients_2/mul_7_grad/tuple/control_dependency_1Identity gradients_2/mul_7_grad/Reshape_1(^gradients_2/mul_7_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_2/mul_7_grad/Reshape_1
w
+gradients_2/SquaredDifference_4_grad/scalarConst^gradients_2/Sum_10_grad/Tile*
valueB
 *   @*
dtype0

(gradients_2/SquaredDifference_4_grad/MulMul+gradients_2/SquaredDifference_4_grad/scalargradients_2/Sum_10_grad/Tile*
T0
y
(gradients_2/SquaredDifference_4_grad/subSubdense_4/BiasAddconcat_8/concat^gradients_2/Sum_10_grad/Tile*
T0

*gradients_2/SquaredDifference_4_grad/mul_1Mul(gradients_2/SquaredDifference_4_grad/Mul(gradients_2/SquaredDifference_4_grad/sub*
T0
]
*gradients_2/SquaredDifference_4_grad/ShapeShapedense_4/BiasAdd*
T0*
out_type0
_
,gradients_2/SquaredDifference_4_grad/Shape_1Shapeconcat_8/concat*
T0*
out_type0
¶
:gradients_2/SquaredDifference_4_grad/BroadcastGradientArgsBroadcastGradientArgs*gradients_2/SquaredDifference_4_grad/Shape,gradients_2/SquaredDifference_4_grad/Shape_1*
T0
½
(gradients_2/SquaredDifference_4_grad/SumSum*gradients_2/SquaredDifference_4_grad/mul_1:gradients_2/SquaredDifference_4_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
¤
,gradients_2/SquaredDifference_4_grad/ReshapeReshape(gradients_2/SquaredDifference_4_grad/Sum*gradients_2/SquaredDifference_4_grad/Shape*
T0*
Tshape0
Į
*gradients_2/SquaredDifference_4_grad/Sum_1Sum*gradients_2/SquaredDifference_4_grad/mul_1<gradients_2/SquaredDifference_4_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
Ŗ
.gradients_2/SquaredDifference_4_grad/Reshape_1Reshape*gradients_2/SquaredDifference_4_grad/Sum_1,gradients_2/SquaredDifference_4_grad/Shape_1*
T0*
Tshape0
h
(gradients_2/SquaredDifference_4_grad/NegNeg.gradients_2/SquaredDifference_4_grad/Reshape_1*
T0

5gradients_2/SquaredDifference_4_grad/tuple/group_depsNoOp)^gradients_2/SquaredDifference_4_grad/Neg-^gradients_2/SquaredDifference_4_grad/Reshape
ł
=gradients_2/SquaredDifference_4_grad/tuple/control_dependencyIdentity,gradients_2/SquaredDifference_4_grad/Reshape6^gradients_2/SquaredDifference_4_grad/tuple/group_deps*
T0*?
_class5
31loc:@gradients_2/SquaredDifference_4_grad/Reshape
ó
?gradients_2/SquaredDifference_4_grad/tuple/control_dependency_1Identity(gradients_2/SquaredDifference_4_grad/Neg6^gradients_2/SquaredDifference_4_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients_2/SquaredDifference_4_grad/Neg
[
gradients_2/Neg_5_grad/NegNeg/gradients_2/mul_7_grad/tuple/control_dependency*
T0

,gradients_2/dense_4/BiasAdd_grad/BiasAddGradBiasAddGrad=gradients_2/SquaredDifference_4_grad/tuple/control_dependency*
T0*
data_formatNHWC
Ø
1gradients_2/dense_4/BiasAdd_grad/tuple/group_depsNoOp>^gradients_2/SquaredDifference_4_grad/tuple/control_dependency-^gradients_2/dense_4/BiasAdd_grad/BiasAddGrad

9gradients_2/dense_4/BiasAdd_grad/tuple/control_dependencyIdentity=gradients_2/SquaredDifference_4_grad/tuple/control_dependency2^gradients_2/dense_4/BiasAdd_grad/tuple/group_deps*
T0*?
_class5
31loc:@gradients_2/SquaredDifference_4_grad/Reshape
ó
;gradients_2/dense_4/BiasAdd_grad/tuple/control_dependency_1Identity,gradients_2/dense_4/BiasAdd_grad/BiasAddGrad2^gradients_2/dense_4/BiasAdd_grad/tuple/group_deps*
T0*?
_class5
31loc:@gradients_2/dense_4/BiasAdd_grad/BiasAddGrad
]
!gradients_2/Log_4_grad/Reciprocal
Reciprocaladd_16^gradients_2/Neg_5_grad/Neg*
T0
i
gradients_2/Log_4_grad/mulMulgradients_2/Neg_5_grad/Neg!gradients_2/Log_4_grad/Reciprocal*
T0
Æ
&gradients_2/dense_4/MatMul_grad/MatMulMatMul9gradients_2/dense_4/BiasAdd_grad/tuple/control_dependencydense_4/kernel/read*
transpose_b(*
T0*
transpose_a( 
©
(gradients_2/dense_4/MatMul_grad/MatMul_1MatMuldense_3/Mul9gradients_2/dense_4/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(

0gradients_2/dense_4/MatMul_grad/tuple/group_depsNoOp'^gradients_2/dense_4/MatMul_grad/MatMul)^gradients_2/dense_4/MatMul_grad/MatMul_1
ć
8gradients_2/dense_4/MatMul_grad/tuple/control_dependencyIdentity&gradients_2/dense_4/MatMul_grad/MatMul1^gradients_2/dense_4/MatMul_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients_2/dense_4/MatMul_grad/MatMul
é
:gradients_2/dense_4/MatMul_grad/tuple/control_dependency_1Identity(gradients_2/dense_4/MatMul_grad/MatMul_11^gradients_2/dense_4/MatMul_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients_2/dense_4/MatMul_grad/MatMul_1
Q
gradients_2/add_16_grad/ShapeShapeconcat_10/concat*
T0*
out_type0
K
gradients_2/add_16_grad/Shape_1Shapeadd_16/y*
T0*
out_type0

-gradients_2/add_16_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_2/add_16_grad/Shapegradients_2/add_16_grad/Shape_1*
T0

gradients_2/add_16_grad/SumSumgradients_2/Log_4_grad/mul-gradients_2/add_16_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
}
gradients_2/add_16_grad/ReshapeReshapegradients_2/add_16_grad/Sumgradients_2/add_16_grad/Shape*
T0*
Tshape0

gradients_2/add_16_grad/Sum_1Sumgradients_2/Log_4_grad/mul/gradients_2/add_16_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0

!gradients_2/add_16_grad/Reshape_1Reshapegradients_2/add_16_grad/Sum_1gradients_2/add_16_grad/Shape_1*
T0*
Tshape0
v
(gradients_2/add_16_grad/tuple/group_depsNoOp ^gradients_2/add_16_grad/Reshape"^gradients_2/add_16_grad/Reshape_1
Å
0gradients_2/add_16_grad/tuple/control_dependencyIdentitygradients_2/add_16_grad/Reshape)^gradients_2/add_16_grad/tuple/group_deps*
T0*2
_class(
&$loc:@gradients_2/add_16_grad/Reshape
Ė
2gradients_2/add_16_grad/tuple/control_dependency_1Identity!gradients_2/add_16_grad/Reshape_1)^gradients_2/add_16_grad/tuple/group_deps*
T0*4
_class*
(&loc:@gradients_2/add_16_grad/Reshape_1
U
"gradients_2/dense_3/Mul_grad/ShapeShapedense_3/BiasAdd*
T0*
out_type0
W
$gradients_2/dense_3/Mul_grad/Shape_1Shapedense_3/Sigmoid*
T0*
out_type0

2gradients_2/dense_3/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs"gradients_2/dense_3/Mul_grad/Shape$gradients_2/dense_3/Mul_grad/Shape_1*
T0
{
 gradients_2/dense_3/Mul_grad/MulMul8gradients_2/dense_4/MatMul_grad/tuple/control_dependencydense_3/Sigmoid*
T0
£
 gradients_2/dense_3/Mul_grad/SumSum gradients_2/dense_3/Mul_grad/Mul2gradients_2/dense_3/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0

$gradients_2/dense_3/Mul_grad/ReshapeReshape gradients_2/dense_3/Mul_grad/Sum"gradients_2/dense_3/Mul_grad/Shape*
T0*
Tshape0
}
"gradients_2/dense_3/Mul_grad/Mul_1Muldense_3/BiasAdd8gradients_2/dense_4/MatMul_grad/tuple/control_dependency*
T0
©
"gradients_2/dense_3/Mul_grad/Sum_1Sum"gradients_2/dense_3/Mul_grad/Mul_14gradients_2/dense_3/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0

&gradients_2/dense_3/Mul_grad/Reshape_1Reshape"gradients_2/dense_3/Mul_grad/Sum_1$gradients_2/dense_3/Mul_grad/Shape_1*
T0*
Tshape0

-gradients_2/dense_3/Mul_grad/tuple/group_depsNoOp%^gradients_2/dense_3/Mul_grad/Reshape'^gradients_2/dense_3/Mul_grad/Reshape_1
Ł
5gradients_2/dense_3/Mul_grad/tuple/control_dependencyIdentity$gradients_2/dense_3/Mul_grad/Reshape.^gradients_2/dense_3/Mul_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients_2/dense_3/Mul_grad/Reshape
ß
7gradients_2/dense_3/Mul_grad/tuple/control_dependency_1Identity&gradients_2/dense_3/Mul_grad/Reshape_1.^gradients_2/dense_3/Mul_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients_2/dense_3/Mul_grad/Reshape_1

,gradients_2/dense_3/Sigmoid_grad/SigmoidGradSigmoidGraddense_3/Sigmoid7gradients_2/dense_3/Mul_grad/tuple/control_dependency_1*
T0
w
$gradients_2/dense_2/Softmax_grad/mulMul0gradients_2/add_16_grad/tuple/control_dependencydense_2/Softmax*
T0
i
6gradients_2/dense_2/Softmax_grad/Sum/reduction_indicesConst*
valueB :
’’’’’’’’’*
dtype0
Æ
$gradients_2/dense_2/Softmax_grad/SumSum$gradients_2/dense_2/Softmax_grad/mul6gradients_2/dense_2/Softmax_grad/Sum/reduction_indices*

Tidx0*
	keep_dims(*
T0

$gradients_2/dense_2/Softmax_grad/subSub0gradients_2/add_16_grad/tuple/control_dependency$gradients_2/dense_2/Softmax_grad/Sum*
T0
m
&gradients_2/dense_2/Softmax_grad/mul_1Mul$gradients_2/dense_2/Softmax_grad/subdense_2/Softmax*
T0
Č
gradients_2/AddNAddN5gradients_2/dense_3/Mul_grad/tuple/control_dependency,gradients_2/dense_3/Sigmoid_grad/SigmoidGrad*
T0*7
_class-
+)loc:@gradients_2/dense_3/Mul_grad/Reshape*
N
m
,gradients_2/dense_3/BiasAdd_grad/BiasAddGradBiasAddGradgradients_2/AddN*
T0*
data_formatNHWC
{
1gradients_2/dense_3/BiasAdd_grad/tuple/group_depsNoOp^gradients_2/AddN-^gradients_2/dense_3/BiasAdd_grad/BiasAddGrad
Ķ
9gradients_2/dense_3/BiasAdd_grad/tuple/control_dependencyIdentitygradients_2/AddN2^gradients_2/dense_3/BiasAdd_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients_2/dense_3/Mul_grad/Reshape
ó
;gradients_2/dense_3/BiasAdd_grad/tuple/control_dependency_1Identity,gradients_2/dense_3/BiasAdd_grad/BiasAddGrad2^gradients_2/dense_3/BiasAdd_grad/tuple/group_deps*
T0*?
_class5
31loc:@gradients_2/dense_3/BiasAdd_grad/BiasAddGrad

,gradients_2/dense_2/BiasAdd_grad/BiasAddGradBiasAddGrad&gradients_2/dense_2/Softmax_grad/mul_1*
T0*
data_formatNHWC

1gradients_2/dense_2/BiasAdd_grad/tuple/group_depsNoOp-^gradients_2/dense_2/BiasAdd_grad/BiasAddGrad'^gradients_2/dense_2/Softmax_grad/mul_1
å
9gradients_2/dense_2/BiasAdd_grad/tuple/control_dependencyIdentity&gradients_2/dense_2/Softmax_grad/mul_12^gradients_2/dense_2/BiasAdd_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients_2/dense_2/Softmax_grad/mul_1
ó
;gradients_2/dense_2/BiasAdd_grad/tuple/control_dependency_1Identity,gradients_2/dense_2/BiasAdd_grad/BiasAddGrad2^gradients_2/dense_2/BiasAdd_grad/tuple/group_deps*
T0*?
_class5
31loc:@gradients_2/dense_2/BiasAdd_grad/BiasAddGrad
Æ
&gradients_2/dense_3/MatMul_grad/MatMulMatMul9gradients_2/dense_3/BiasAdd_grad/tuple/control_dependencydense_3/kernel/read*
transpose_b(*
T0*
transpose_a( 
§
(gradients_2/dense_3/MatMul_grad/MatMul_1MatMul	concat_119gradients_2/dense_3/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(

0gradients_2/dense_3/MatMul_grad/tuple/group_depsNoOp'^gradients_2/dense_3/MatMul_grad/MatMul)^gradients_2/dense_3/MatMul_grad/MatMul_1
ć
8gradients_2/dense_3/MatMul_grad/tuple/control_dependencyIdentity&gradients_2/dense_3/MatMul_grad/MatMul1^gradients_2/dense_3/MatMul_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients_2/dense_3/MatMul_grad/MatMul
é
:gradients_2/dense_3/MatMul_grad/tuple/control_dependency_1Identity(gradients_2/dense_3/MatMul_grad/MatMul_11^gradients_2/dense_3/MatMul_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients_2/dense_3/MatMul_grad/MatMul_1
Æ
&gradients_2/dense_2/MatMul_grad/MatMulMatMul9gradients_2/dense_2/BiasAdd_grad/tuple/control_dependencydense_2/kernel/read*
transpose_b(*
T0*
transpose_a( 
©
(gradients_2/dense_2/MatMul_grad/MatMul_1MatMuldense_1/Mul9gradients_2/dense_2/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(

0gradients_2/dense_2/MatMul_grad/tuple/group_depsNoOp'^gradients_2/dense_2/MatMul_grad/MatMul)^gradients_2/dense_2/MatMul_grad/MatMul_1
ć
8gradients_2/dense_2/MatMul_grad/tuple/control_dependencyIdentity&gradients_2/dense_2/MatMul_grad/MatMul1^gradients_2/dense_2/MatMul_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients_2/dense_2/MatMul_grad/MatMul
é
:gradients_2/dense_2/MatMul_grad/tuple/control_dependency_1Identity(gradients_2/dense_2/MatMul_grad/MatMul_11^gradients_2/dense_2/MatMul_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients_2/dense_2/MatMul_grad/MatMul_1
I
gradients_2/concat_11_grad/RankConst*
value	B :*
dtype0
d
gradients_2/concat_11_grad/modFloorModconcat_11/axisgradients_2/concat_11_grad/Rank*
T0
S
 gradients_2/concat_11_grad/ShapeShapeconcat_7/concat*
T0*
out_type0
l
!gradients_2/concat_11_grad/ShapeNShapeNconcat_7/concatStopGradient*
T0*
out_type0*
N
Ø
'gradients_2/concat_11_grad/ConcatOffsetConcatOffsetgradients_2/concat_11_grad/mod!gradients_2/concat_11_grad/ShapeN#gradients_2/concat_11_grad/ShapeN:1*
N
Å
 gradients_2/concat_11_grad/SliceSlice8gradients_2/dense_3/MatMul_grad/tuple/control_dependency'gradients_2/concat_11_grad/ConcatOffset!gradients_2/concat_11_grad/ShapeN*
T0*
Index0
Ė
"gradients_2/concat_11_grad/Slice_1Slice8gradients_2/dense_3/MatMul_grad/tuple/control_dependency)gradients_2/concat_11_grad/ConcatOffset:1#gradients_2/concat_11_grad/ShapeN:1*
T0*
Index0
{
+gradients_2/concat_11_grad/tuple/group_depsNoOp!^gradients_2/concat_11_grad/Slice#^gradients_2/concat_11_grad/Slice_1
Ķ
3gradients_2/concat_11_grad/tuple/control_dependencyIdentity gradients_2/concat_11_grad/Slice,^gradients_2/concat_11_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_2/concat_11_grad/Slice
Ó
5gradients_2/concat_11_grad/tuple/control_dependency_1Identity"gradients_2/concat_11_grad/Slice_1,^gradients_2/concat_11_grad/tuple/group_deps*
T0*5
_class+
)'loc:@gradients_2/concat_11_grad/Slice_1
U
"gradients_2/dense_1/Mul_grad/ShapeShapedense_1/BiasAdd*
T0*
out_type0
W
$gradients_2/dense_1/Mul_grad/Shape_1Shapedense_1/Sigmoid*
T0*
out_type0

2gradients_2/dense_1/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs"gradients_2/dense_1/Mul_grad/Shape$gradients_2/dense_1/Mul_grad/Shape_1*
T0
{
 gradients_2/dense_1/Mul_grad/MulMul8gradients_2/dense_2/MatMul_grad/tuple/control_dependencydense_1/Sigmoid*
T0
£
 gradients_2/dense_1/Mul_grad/SumSum gradients_2/dense_1/Mul_grad/Mul2gradients_2/dense_1/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0

$gradients_2/dense_1/Mul_grad/ReshapeReshape gradients_2/dense_1/Mul_grad/Sum"gradients_2/dense_1/Mul_grad/Shape*
T0*
Tshape0
}
"gradients_2/dense_1/Mul_grad/Mul_1Muldense_1/BiasAdd8gradients_2/dense_2/MatMul_grad/tuple/control_dependency*
T0
©
"gradients_2/dense_1/Mul_grad/Sum_1Sum"gradients_2/dense_1/Mul_grad/Mul_14gradients_2/dense_1/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0

&gradients_2/dense_1/Mul_grad/Reshape_1Reshape"gradients_2/dense_1/Mul_grad/Sum_1$gradients_2/dense_1/Mul_grad/Shape_1*
T0*
Tshape0

-gradients_2/dense_1/Mul_grad/tuple/group_depsNoOp%^gradients_2/dense_1/Mul_grad/Reshape'^gradients_2/dense_1/Mul_grad/Reshape_1
Ł
5gradients_2/dense_1/Mul_grad/tuple/control_dependencyIdentity$gradients_2/dense_1/Mul_grad/Reshape.^gradients_2/dense_1/Mul_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients_2/dense_1/Mul_grad/Reshape
ß
7gradients_2/dense_1/Mul_grad/tuple/control_dependency_1Identity&gradients_2/dense_1/Mul_grad/Reshape_1.^gradients_2/dense_1/Mul_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients_2/dense_1/Mul_grad/Reshape_1

,gradients_2/dense_1/Sigmoid_grad/SigmoidGradSigmoidGraddense_1/Sigmoid7gradients_2/dense_1/Mul_grad/tuple/control_dependency_1*
T0
Ź
gradients_2/AddN_1AddN5gradients_2/dense_1/Mul_grad/tuple/control_dependency,gradients_2/dense_1/Sigmoid_grad/SigmoidGrad*
T0*7
_class-
+)loc:@gradients_2/dense_1/Mul_grad/Reshape*
N
o
,gradients_2/dense_1/BiasAdd_grad/BiasAddGradBiasAddGradgradients_2/AddN_1*
T0*
data_formatNHWC
}
1gradients_2/dense_1/BiasAdd_grad/tuple/group_depsNoOp^gradients_2/AddN_1-^gradients_2/dense_1/BiasAdd_grad/BiasAddGrad
Ļ
9gradients_2/dense_1/BiasAdd_grad/tuple/control_dependencyIdentitygradients_2/AddN_12^gradients_2/dense_1/BiasAdd_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients_2/dense_1/Mul_grad/Reshape
ó
;gradients_2/dense_1/BiasAdd_grad/tuple/control_dependency_1Identity,gradients_2/dense_1/BiasAdd_grad/BiasAddGrad2^gradients_2/dense_1/BiasAdd_grad/tuple/group_deps*
T0*?
_class5
31loc:@gradients_2/dense_1/BiasAdd_grad/BiasAddGrad
Æ
&gradients_2/dense_1/MatMul_grad/MatMulMatMul9gradients_2/dense_1/BiasAdd_grad/tuple/control_dependencydense_1/kernel/read*
transpose_b(*
T0*
transpose_a( 
¦
(gradients_2/dense_1/MatMul_grad/MatMul_1MatMulconcat_99gradients_2/dense_1/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(

0gradients_2/dense_1/MatMul_grad/tuple/group_depsNoOp'^gradients_2/dense_1/MatMul_grad/MatMul)^gradients_2/dense_1/MatMul_grad/MatMul_1
ć
8gradients_2/dense_1/MatMul_grad/tuple/control_dependencyIdentity&gradients_2/dense_1/MatMul_grad/MatMul1^gradients_2/dense_1/MatMul_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients_2/dense_1/MatMul_grad/MatMul
é
:gradients_2/dense_1/MatMul_grad/tuple/control_dependency_1Identity(gradients_2/dense_1/MatMul_grad/MatMul_11^gradients_2/dense_1/MatMul_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients_2/dense_1/MatMul_grad/MatMul_1
H
gradients_2/concat_9_grad/RankConst*
value	B :*
dtype0
a
gradients_2/concat_9_grad/modFloorModconcat_9/axisgradients_2/concat_9_grad/Rank*
T0
R
gradients_2/concat_9_grad/ShapeShapeconcat_7/concat*
T0*
out_type0
n
 gradients_2/concat_9_grad/ShapeNShapeNconcat_7/concatconcat_8/concat*
T0*
out_type0*
N
¤
&gradients_2/concat_9_grad/ConcatOffsetConcatOffsetgradients_2/concat_9_grad/mod gradients_2/concat_9_grad/ShapeN"gradients_2/concat_9_grad/ShapeN:1*
N
Ā
gradients_2/concat_9_grad/SliceSlice8gradients_2/dense_1/MatMul_grad/tuple/control_dependency&gradients_2/concat_9_grad/ConcatOffset gradients_2/concat_9_grad/ShapeN*
T0*
Index0
Č
!gradients_2/concat_9_grad/Slice_1Slice8gradients_2/dense_1/MatMul_grad/tuple/control_dependency(gradients_2/concat_9_grad/ConcatOffset:1"gradients_2/concat_9_grad/ShapeN:1*
T0*
Index0
x
*gradients_2/concat_9_grad/tuple/group_depsNoOp ^gradients_2/concat_9_grad/Slice"^gradients_2/concat_9_grad/Slice_1
É
2gradients_2/concat_9_grad/tuple/control_dependencyIdentitygradients_2/concat_9_grad/Slice+^gradients_2/concat_9_grad/tuple/group_deps*
T0*2
_class(
&$loc:@gradients_2/concat_9_grad/Slice
Ļ
4gradients_2/concat_9_grad/tuple/control_dependency_1Identity!gradients_2/concat_9_grad/Slice_1+^gradients_2/concat_9_grad/tuple/group_deps*
T0*4
_class*
(&loc:@gradients_2/concat_9_grad/Slice_1
Ź
gradients_2/AddN_2AddN3gradients_2/concat_11_grad/tuple/control_dependency2gradients_2/concat_9_grad/tuple/control_dependency*
T0*3
_class)
'%loc:@gradients_2/concat_11_grad/Slice*
N
ą
gradients_2/AddN_3AddN?gradients_2/SquaredDifference_4_grad/tuple/control_dependency_14gradients_2/concat_9_grad/tuple/control_dependency_1*
T0*;
_class1
/-loc:@gradients_2/SquaredDifference_4_grad/Neg*
N

@gradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/ShapeShape-curiosity_vector_obs_encoder/hidden_1/BiasAdd*
T0*
out_type0

Bgradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Shape_1Shape-curiosity_vector_obs_encoder/hidden_1/Sigmoid*
T0*
out_type0
ų
Pgradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs@gradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/ShapeBgradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Shape_1*
T0

>gradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/MulMulgradients_2/AddN_2-curiosity_vector_obs_encoder/hidden_1/Sigmoid*
T0
ż
>gradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/SumSum>gradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/MulPgradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
ę
Bgradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/ReshapeReshape>gradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Sum@gradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Shape*
T0*
Tshape0

@gradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Mul_1Mul-curiosity_vector_obs_encoder/hidden_1/BiasAddgradients_2/AddN_2*
T0

@gradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Sum_1Sum@gradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Mul_1Rgradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
ģ
Dgradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Reshape_1Reshape@gradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Sum_1Bgradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Shape_1*
T0*
Tshape0
ß
Kgradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/tuple/group_depsNoOpC^gradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/ReshapeE^gradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Reshape_1
Ń
Sgradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/tuple/control_dependencyIdentityBgradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/ReshapeL^gradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/tuple/group_deps*
T0*U
_classK
IGloc:@gradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Reshape
×
Ugradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/tuple/control_dependency_1IdentityDgradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Reshape_1L^gradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/tuple/group_deps*
T0*W
_classM
KIloc:@gradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Reshape_1

Bgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/ShapeShape/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd*
T0*
out_type0

Dgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Shape_1Shape/curiosity_vector_obs_encoder_1/hidden_1/Sigmoid*
T0*
out_type0
ž
Rgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/BroadcastGradientArgsBroadcastGradientArgsBgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/ShapeDgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Shape_1*
T0

@gradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/MulMulgradients_2/AddN_3/curiosity_vector_obs_encoder_1/hidden_1/Sigmoid*
T0

@gradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/SumSum@gradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/MulRgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
ģ
Dgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/ReshapeReshape@gradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/SumBgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Shape*
T0*
Tshape0

Bgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Mul_1Mul/curiosity_vector_obs_encoder_1/hidden_1/BiasAddgradients_2/AddN_3*
T0

Bgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Sum_1SumBgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Mul_1Tgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
ņ
Fgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Reshape_1ReshapeBgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Sum_1Dgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Shape_1*
T0*
Tshape0
å
Mgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/tuple/group_depsNoOpE^gradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/ReshapeG^gradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Reshape_1
Ł
Ugradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/tuple/control_dependencyIdentityDgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/ReshapeN^gradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/tuple/group_deps*
T0*W
_classM
KIloc:@gradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Reshape
ß
Wgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/tuple/control_dependency_1IdentityFgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Reshape_1N^gradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/tuple/group_deps*
T0*Y
_classO
MKloc:@gradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Reshape_1
č
Jgradients_2/curiosity_vector_obs_encoder/hidden_1/Sigmoid_grad/SigmoidGradSigmoidGrad-curiosity_vector_obs_encoder/hidden_1/SigmoidUgradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/tuple/control_dependency_1*
T0
ī
Lgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Sigmoid_grad/SigmoidGradSigmoidGrad/curiosity_vector_obs_encoder_1/hidden_1/SigmoidWgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/tuple/control_dependency_1*
T0
¤
gradients_2/AddN_4AddNSgradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/tuple/control_dependencyJgradients_2/curiosity_vector_obs_encoder/hidden_1/Sigmoid_grad/SigmoidGrad*
T0*U
_classK
IGloc:@gradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Reshape*
N

Jgradients_2/curiosity_vector_obs_encoder/hidden_1/BiasAdd_grad/BiasAddGradBiasAddGradgradients_2/AddN_4*
T0*
data_formatNHWC
¹
Ogradients_2/curiosity_vector_obs_encoder/hidden_1/BiasAdd_grad/tuple/group_depsNoOp^gradients_2/AddN_4K^gradients_2/curiosity_vector_obs_encoder/hidden_1/BiasAdd_grad/BiasAddGrad
©
Wgradients_2/curiosity_vector_obs_encoder/hidden_1/BiasAdd_grad/tuple/control_dependencyIdentitygradients_2/AddN_4P^gradients_2/curiosity_vector_obs_encoder/hidden_1/BiasAdd_grad/tuple/group_deps*
T0*U
_classK
IGloc:@gradients_2/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Reshape
ė
Ygradients_2/curiosity_vector_obs_encoder/hidden_1/BiasAdd_grad/tuple/control_dependency_1IdentityJgradients_2/curiosity_vector_obs_encoder/hidden_1/BiasAdd_grad/BiasAddGradP^gradients_2/curiosity_vector_obs_encoder/hidden_1/BiasAdd_grad/tuple/group_deps*
T0*]
_classS
QOloc:@gradients_2/curiosity_vector_obs_encoder/hidden_1/BiasAdd_grad/BiasAddGrad
Ŗ
gradients_2/AddN_5AddNUgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/tuple/control_dependencyLgradients_2/curiosity_vector_obs_encoder_1/hidden_1/Sigmoid_grad/SigmoidGrad*
T0*W
_classM
KIloc:@gradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Reshape*
N

Lgradients_2/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd_grad/BiasAddGradBiasAddGradgradients_2/AddN_5*
T0*
data_formatNHWC
½
Qgradients_2/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd_grad/tuple/group_depsNoOp^gradients_2/AddN_5M^gradients_2/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd_grad/BiasAddGrad
Æ
Ygradients_2/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd_grad/tuple/control_dependencyIdentitygradients_2/AddN_5R^gradients_2/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd_grad/tuple/group_deps*
T0*W
_classM
KIloc:@gradients_2/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Reshape
ó
[gradients_2/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd_grad/tuple/control_dependency_1IdentityLgradients_2/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd_grad/BiasAddGradR^gradients_2/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd_grad/tuple/group_deps*
T0*_
_classU
SQloc:@gradients_2/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd_grad/BiasAddGrad

Dgradients_2/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/MatMulMatMulWgradients_2/curiosity_vector_obs_encoder/hidden_1/BiasAdd_grad/tuple/control_dependency1curiosity_vector_obs_encoder/hidden_1/kernel/read*
transpose_b(*
T0*
transpose_a( 

Fgradients_2/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/MatMul_1MatMul)curiosity_vector_obs_encoder/hidden_0/MulWgradients_2/curiosity_vector_obs_encoder/hidden_1/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
ę
Ngradients_2/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/tuple/group_depsNoOpE^gradients_2/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/MatMulG^gradients_2/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/MatMul_1
Ū
Vgradients_2/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/tuple/control_dependencyIdentityDgradients_2/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/MatMulO^gradients_2/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/tuple/group_deps*
T0*W
_classM
KIloc:@gradients_2/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/MatMul
į
Xgradients_2/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/tuple/control_dependency_1IdentityFgradients_2/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/MatMul_1O^gradients_2/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/tuple/group_deps*
T0*Y
_classO
MKloc:@gradients_2/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/MatMul_1

Fgradients_2/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/MatMulMatMulYgradients_2/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd_grad/tuple/control_dependency1curiosity_vector_obs_encoder/hidden_1/kernel/read*
transpose_b(*
T0*
transpose_a( 

Hgradients_2/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/MatMul_1MatMul+curiosity_vector_obs_encoder_1/hidden_0/MulYgradients_2/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
ģ
Pgradients_2/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/tuple/group_depsNoOpG^gradients_2/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/MatMulI^gradients_2/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/MatMul_1
ć
Xgradients_2/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/tuple/control_dependencyIdentityFgradients_2/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/MatMulQ^gradients_2/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/tuple/group_deps*
T0*Y
_classO
MKloc:@gradients_2/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/MatMul
é
Zgradients_2/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/tuple/control_dependency_1IdentityHgradients_2/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/MatMul_1Q^gradients_2/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/tuple/group_deps*
T0*[
_classQ
OMloc:@gradients_2/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/MatMul_1
Ć
gradients_2/AddN_6AddNYgradients_2/curiosity_vector_obs_encoder/hidden_1/BiasAdd_grad/tuple/control_dependency_1[gradients_2/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd_grad/tuple/control_dependency_1*
T0*]
_classS
QOloc:@gradients_2/curiosity_vector_obs_encoder/hidden_1/BiasAdd_grad/BiasAddGrad*
N

@gradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/ShapeShape-curiosity_vector_obs_encoder/hidden_0/BiasAdd*
T0*
out_type0

Bgradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Shape_1Shape-curiosity_vector_obs_encoder/hidden_0/Sigmoid*
T0*
out_type0
ų
Pgradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs@gradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/ShapeBgradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Shape_1*
T0
Õ
>gradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/MulMulVgradients_2/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/tuple/control_dependency-curiosity_vector_obs_encoder/hidden_0/Sigmoid*
T0
ż
>gradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/SumSum>gradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/MulPgradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
ę
Bgradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/ReshapeReshape>gradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Sum@gradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Shape*
T0*
Tshape0
×
@gradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Mul_1Mul-curiosity_vector_obs_encoder/hidden_0/BiasAddVgradients_2/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/tuple/control_dependency*
T0

@gradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Sum_1Sum@gradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Mul_1Rgradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
ģ
Dgradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Reshape_1Reshape@gradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Sum_1Bgradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Shape_1*
T0*
Tshape0
ß
Kgradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/tuple/group_depsNoOpC^gradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/ReshapeE^gradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Reshape_1
Ń
Sgradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/tuple/control_dependencyIdentityBgradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/ReshapeL^gradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/tuple/group_deps*
T0*U
_classK
IGloc:@gradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Reshape
×
Ugradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/tuple/control_dependency_1IdentityDgradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Reshape_1L^gradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/tuple/group_deps*
T0*W
_classM
KIloc:@gradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Reshape_1

Bgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/ShapeShape/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd*
T0*
out_type0

Dgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Shape_1Shape/curiosity_vector_obs_encoder_1/hidden_0/Sigmoid*
T0*
out_type0
ž
Rgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/BroadcastGradientArgsBroadcastGradientArgsBgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/ShapeDgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Shape_1*
T0
Ū
@gradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/MulMulXgradients_2/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/tuple/control_dependency/curiosity_vector_obs_encoder_1/hidden_0/Sigmoid*
T0

@gradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/SumSum@gradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/MulRgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
ģ
Dgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/ReshapeReshape@gradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/SumBgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Shape*
T0*
Tshape0
Ż
Bgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Mul_1Mul/curiosity_vector_obs_encoder_1/hidden_0/BiasAddXgradients_2/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/tuple/control_dependency*
T0

Bgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Sum_1SumBgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Mul_1Tgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
ņ
Fgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Reshape_1ReshapeBgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Sum_1Dgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Shape_1*
T0*
Tshape0
å
Mgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/tuple/group_depsNoOpE^gradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/ReshapeG^gradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Reshape_1
Ł
Ugradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/tuple/control_dependencyIdentityDgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/ReshapeN^gradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/tuple/group_deps*
T0*W
_classM
KIloc:@gradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Reshape
ß
Wgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/tuple/control_dependency_1IdentityFgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Reshape_1N^gradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/tuple/group_deps*
T0*Y
_classO
MKloc:@gradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Reshape_1
½
gradients_2/AddN_7AddNXgradients_2/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/tuple/control_dependency_1Zgradients_2/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/tuple/control_dependency_1*
T0*Y
_classO
MKloc:@gradients_2/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/MatMul_1*
N
č
Jgradients_2/curiosity_vector_obs_encoder/hidden_0/Sigmoid_grad/SigmoidGradSigmoidGrad-curiosity_vector_obs_encoder/hidden_0/SigmoidUgradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/tuple/control_dependency_1*
T0
ī
Lgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Sigmoid_grad/SigmoidGradSigmoidGrad/curiosity_vector_obs_encoder_1/hidden_0/SigmoidWgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/tuple/control_dependency_1*
T0
¤
gradients_2/AddN_8AddNSgradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/tuple/control_dependencyJgradients_2/curiosity_vector_obs_encoder/hidden_0/Sigmoid_grad/SigmoidGrad*
T0*U
_classK
IGloc:@gradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Reshape*
N

Jgradients_2/curiosity_vector_obs_encoder/hidden_0/BiasAdd_grad/BiasAddGradBiasAddGradgradients_2/AddN_8*
T0*
data_formatNHWC
¹
Ogradients_2/curiosity_vector_obs_encoder/hidden_0/BiasAdd_grad/tuple/group_depsNoOp^gradients_2/AddN_8K^gradients_2/curiosity_vector_obs_encoder/hidden_0/BiasAdd_grad/BiasAddGrad
©
Wgradients_2/curiosity_vector_obs_encoder/hidden_0/BiasAdd_grad/tuple/control_dependencyIdentitygradients_2/AddN_8P^gradients_2/curiosity_vector_obs_encoder/hidden_0/BiasAdd_grad/tuple/group_deps*
T0*U
_classK
IGloc:@gradients_2/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Reshape
ė
Ygradients_2/curiosity_vector_obs_encoder/hidden_0/BiasAdd_grad/tuple/control_dependency_1IdentityJgradients_2/curiosity_vector_obs_encoder/hidden_0/BiasAdd_grad/BiasAddGradP^gradients_2/curiosity_vector_obs_encoder/hidden_0/BiasAdd_grad/tuple/group_deps*
T0*]
_classS
QOloc:@gradients_2/curiosity_vector_obs_encoder/hidden_0/BiasAdd_grad/BiasAddGrad
Ŗ
gradients_2/AddN_9AddNUgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/tuple/control_dependencyLgradients_2/curiosity_vector_obs_encoder_1/hidden_0/Sigmoid_grad/SigmoidGrad*
T0*W
_classM
KIloc:@gradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Reshape*
N

Lgradients_2/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd_grad/BiasAddGradBiasAddGradgradients_2/AddN_9*
T0*
data_formatNHWC
½
Qgradients_2/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd_grad/tuple/group_depsNoOp^gradients_2/AddN_9M^gradients_2/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd_grad/BiasAddGrad
Æ
Ygradients_2/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd_grad/tuple/control_dependencyIdentitygradients_2/AddN_9R^gradients_2/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd_grad/tuple/group_deps*
T0*W
_classM
KIloc:@gradients_2/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Reshape
ó
[gradients_2/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd_grad/tuple/control_dependency_1IdentityLgradients_2/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd_grad/BiasAddGradR^gradients_2/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd_grad/tuple/group_deps*
T0*_
_classU
SQloc:@gradients_2/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd_grad/BiasAddGrad

Dgradients_2/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/MatMulMatMulWgradients_2/curiosity_vector_obs_encoder/hidden_0/BiasAdd_grad/tuple/control_dependency1curiosity_vector_obs_encoder/hidden_0/kernel/read*
transpose_b(*
T0*
transpose_a( 
ģ
Fgradients_2/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/MatMul_1MatMulvector_observationWgradients_2/curiosity_vector_obs_encoder/hidden_0/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
ę
Ngradients_2/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/tuple/group_depsNoOpE^gradients_2/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/MatMulG^gradients_2/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/MatMul_1
Ū
Vgradients_2/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/tuple/control_dependencyIdentityDgradients_2/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/MatMulO^gradients_2/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/tuple/group_deps*
T0*W
_classM
KIloc:@gradients_2/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/MatMul
į
Xgradients_2/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/tuple/control_dependency_1IdentityFgradients_2/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/MatMul_1O^gradients_2/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/tuple/group_deps*
T0*Y
_classO
MKloc:@gradients_2/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/MatMul_1

Fgradients_2/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/MatMulMatMulYgradients_2/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd_grad/tuple/control_dependency1curiosity_vector_obs_encoder/hidden_0/kernel/read*
transpose_b(*
T0*
transpose_a( 
’
Hgradients_2/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/MatMul_1MatMul!curiosity_next_vector_observationYgradients_2/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
ģ
Pgradients_2/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/tuple/group_depsNoOpG^gradients_2/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/MatMulI^gradients_2/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/MatMul_1
ć
Xgradients_2/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/tuple/control_dependencyIdentityFgradients_2/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/MatMulQ^gradients_2/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/tuple/group_deps*
T0*Y
_classO
MKloc:@gradients_2/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/MatMul
é
Zgradients_2/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/tuple/control_dependency_1IdentityHgradients_2/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/MatMul_1Q^gradients_2/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/tuple/group_deps*
T0*[
_classQ
OMloc:@gradients_2/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/MatMul_1
Ä
gradients_2/AddN_10AddNYgradients_2/curiosity_vector_obs_encoder/hidden_0/BiasAdd_grad/tuple/control_dependency_1[gradients_2/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd_grad/tuple/control_dependency_1*
T0*]
_classS
QOloc:@gradients_2/curiosity_vector_obs_encoder/hidden_0/BiasAdd_grad/BiasAddGrad*
N
¾
gradients_2/AddN_11AddNXgradients_2/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/tuple/control_dependency_1Zgradients_2/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/tuple/control_dependency_1*
T0*Y
_classO
MKloc:@gradients_2/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/MatMul_1*
N

beta1_power_1/initial_valueConst*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
valueB
 *fff?*
dtype0

beta1_power_1
VariableV2*
shape: *
shared_name *=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
dtype0*
	container 
»
beta1_power_1/AssignAssignbeta1_power_1beta1_power_1/initial_value*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
validate_shape(
u
beta1_power_1/readIdentitybeta1_power_1*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias

beta2_power_1/initial_valueConst*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
valueB
 *w¾?*
dtype0

beta2_power_1
VariableV2*
shape: *
shared_name *=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
dtype0*
	container 
»
beta2_power_1/AssignAssignbeta2_power_1beta2_power_1/initial_value*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
validate_shape(
u
beta2_power_1/readIdentitybeta2_power_1*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias
É
Scuriosity_vector_obs_encoder/hidden_0/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
valueB"=     *?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
dtype0
·
Icuriosity_vector_obs_encoder/hidden_0/kernel/Adam/Initializer/zeros/ConstConst*
valueB
 *    *?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
dtype0
Ē
Ccuriosity_vector_obs_encoder/hidden_0/kernel/Adam/Initializer/zerosFillScuriosity_vector_obs_encoder/hidden_0/kernel/Adam/Initializer/zeros/shape_as_tensorIcuriosity_vector_obs_encoder/hidden_0/kernel/Adam/Initializer/zeros/Const*
T0*

index_type0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel
Č
1curiosity_vector_obs_encoder/hidden_0/kernel/Adam
VariableV2*
shape:
½*
shared_name *?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
dtype0*
	container 
­
8curiosity_vector_obs_encoder/hidden_0/kernel/Adam/AssignAssign1curiosity_vector_obs_encoder/hidden_0/kernel/AdamCcuriosity_vector_obs_encoder/hidden_0/kernel/Adam/Initializer/zeros*
use_locking(*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
validate_shape(
æ
6curiosity_vector_obs_encoder/hidden_0/kernel/Adam/readIdentity1curiosity_vector_obs_encoder/hidden_0/kernel/Adam*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel
Ė
Ucuriosity_vector_obs_encoder/hidden_0/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB"=     *?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
dtype0
¹
Kcuriosity_vector_obs_encoder/hidden_0/kernel/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    *?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
dtype0
Ķ
Ecuriosity_vector_obs_encoder/hidden_0/kernel/Adam_1/Initializer/zerosFillUcuriosity_vector_obs_encoder/hidden_0/kernel/Adam_1/Initializer/zeros/shape_as_tensorKcuriosity_vector_obs_encoder/hidden_0/kernel/Adam_1/Initializer/zeros/Const*
T0*

index_type0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel
Ź
3curiosity_vector_obs_encoder/hidden_0/kernel/Adam_1
VariableV2*
shape:
½*
shared_name *?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
dtype0*
	container 
³
:curiosity_vector_obs_encoder/hidden_0/kernel/Adam_1/AssignAssign3curiosity_vector_obs_encoder/hidden_0/kernel/Adam_1Ecuriosity_vector_obs_encoder/hidden_0/kernel/Adam_1/Initializer/zeros*
use_locking(*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
validate_shape(
Ć
8curiosity_vector_obs_encoder/hidden_0/kernel/Adam_1/readIdentity3curiosity_vector_obs_encoder/hidden_0/kernel/Adam_1*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel
²
Acuriosity_vector_obs_encoder/hidden_0/bias/Adam/Initializer/zerosConst*
valueB*    *=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
dtype0
æ
/curiosity_vector_obs_encoder/hidden_0/bias/Adam
VariableV2*
shape:*
shared_name *=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
dtype0*
	container 
„
6curiosity_vector_obs_encoder/hidden_0/bias/Adam/AssignAssign/curiosity_vector_obs_encoder/hidden_0/bias/AdamAcuriosity_vector_obs_encoder/hidden_0/bias/Adam/Initializer/zeros*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
validate_shape(
¹
4curiosity_vector_obs_encoder/hidden_0/bias/Adam/readIdentity/curiosity_vector_obs_encoder/hidden_0/bias/Adam*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias
“
Ccuriosity_vector_obs_encoder/hidden_0/bias/Adam_1/Initializer/zerosConst*
valueB*    *=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
dtype0
Į
1curiosity_vector_obs_encoder/hidden_0/bias/Adam_1
VariableV2*
shape:*
shared_name *=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
dtype0*
	container 
«
8curiosity_vector_obs_encoder/hidden_0/bias/Adam_1/AssignAssign1curiosity_vector_obs_encoder/hidden_0/bias/Adam_1Ccuriosity_vector_obs_encoder/hidden_0/bias/Adam_1/Initializer/zeros*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
validate_shape(
½
6curiosity_vector_obs_encoder/hidden_0/bias/Adam_1/readIdentity1curiosity_vector_obs_encoder/hidden_0/bias/Adam_1*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias
É
Scuriosity_vector_obs_encoder/hidden_1/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
valueB"      *?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
dtype0
·
Icuriosity_vector_obs_encoder/hidden_1/kernel/Adam/Initializer/zeros/ConstConst*
valueB
 *    *?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
dtype0
Ē
Ccuriosity_vector_obs_encoder/hidden_1/kernel/Adam/Initializer/zerosFillScuriosity_vector_obs_encoder/hidden_1/kernel/Adam/Initializer/zeros/shape_as_tensorIcuriosity_vector_obs_encoder/hidden_1/kernel/Adam/Initializer/zeros/Const*
T0*

index_type0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel
Č
1curiosity_vector_obs_encoder/hidden_1/kernel/Adam
VariableV2*
shape:
*
shared_name *?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
dtype0*
	container 
­
8curiosity_vector_obs_encoder/hidden_1/kernel/Adam/AssignAssign1curiosity_vector_obs_encoder/hidden_1/kernel/AdamCcuriosity_vector_obs_encoder/hidden_1/kernel/Adam/Initializer/zeros*
use_locking(*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
validate_shape(
æ
6curiosity_vector_obs_encoder/hidden_1/kernel/Adam/readIdentity1curiosity_vector_obs_encoder/hidden_1/kernel/Adam*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel
Ė
Ucuriosity_vector_obs_encoder/hidden_1/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB"      *?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
dtype0
¹
Kcuriosity_vector_obs_encoder/hidden_1/kernel/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    *?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
dtype0
Ķ
Ecuriosity_vector_obs_encoder/hidden_1/kernel/Adam_1/Initializer/zerosFillUcuriosity_vector_obs_encoder/hidden_1/kernel/Adam_1/Initializer/zeros/shape_as_tensorKcuriosity_vector_obs_encoder/hidden_1/kernel/Adam_1/Initializer/zeros/Const*
T0*

index_type0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel
Ź
3curiosity_vector_obs_encoder/hidden_1/kernel/Adam_1
VariableV2*
shape:
*
shared_name *?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
dtype0*
	container 
³
:curiosity_vector_obs_encoder/hidden_1/kernel/Adam_1/AssignAssign3curiosity_vector_obs_encoder/hidden_1/kernel/Adam_1Ecuriosity_vector_obs_encoder/hidden_1/kernel/Adam_1/Initializer/zeros*
use_locking(*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
validate_shape(
Ć
8curiosity_vector_obs_encoder/hidden_1/kernel/Adam_1/readIdentity3curiosity_vector_obs_encoder/hidden_1/kernel/Adam_1*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel
²
Acuriosity_vector_obs_encoder/hidden_1/bias/Adam/Initializer/zerosConst*
valueB*    *=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias*
dtype0
æ
/curiosity_vector_obs_encoder/hidden_1/bias/Adam
VariableV2*
shape:*
shared_name *=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias*
dtype0*
	container 
„
6curiosity_vector_obs_encoder/hidden_1/bias/Adam/AssignAssign/curiosity_vector_obs_encoder/hidden_1/bias/AdamAcuriosity_vector_obs_encoder/hidden_1/bias/Adam/Initializer/zeros*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias*
validate_shape(
¹
4curiosity_vector_obs_encoder/hidden_1/bias/Adam/readIdentity/curiosity_vector_obs_encoder/hidden_1/bias/Adam*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias
“
Ccuriosity_vector_obs_encoder/hidden_1/bias/Adam_1/Initializer/zerosConst*
valueB*    *=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias*
dtype0
Į
1curiosity_vector_obs_encoder/hidden_1/bias/Adam_1
VariableV2*
shape:*
shared_name *=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias*
dtype0*
	container 
«
8curiosity_vector_obs_encoder/hidden_1/bias/Adam_1/AssignAssign1curiosity_vector_obs_encoder/hidden_1/bias/Adam_1Ccuriosity_vector_obs_encoder/hidden_1/bias/Adam_1/Initializer/zeros*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias*
validate_shape(
½
6curiosity_vector_obs_encoder/hidden_1/bias/Adam_1/readIdentity1curiosity_vector_obs_encoder/hidden_1/bias/Adam_1*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias

5dense_1/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
valueB"      *!
_class
loc:@dense_1/kernel*
dtype0
{
+dense_1/kernel/Adam/Initializer/zeros/ConstConst*
valueB
 *    *!
_class
loc:@dense_1/kernel*
dtype0
Ļ
%dense_1/kernel/Adam/Initializer/zerosFill5dense_1/kernel/Adam/Initializer/zeros/shape_as_tensor+dense_1/kernel/Adam/Initializer/zeros/Const*
T0*

index_type0*!
_class
loc:@dense_1/kernel

dense_1/kernel/Adam
VariableV2*
shape:
*
shared_name *!
_class
loc:@dense_1/kernel*
dtype0*
	container 
µ
dense_1/kernel/Adam/AssignAssigndense_1/kernel/Adam%dense_1/kernel/Adam/Initializer/zeros*
use_locking(*
T0*!
_class
loc:@dense_1/kernel*
validate_shape(
e
dense_1/kernel/Adam/readIdentitydense_1/kernel/Adam*
T0*!
_class
loc:@dense_1/kernel

7dense_1/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB"      *!
_class
loc:@dense_1/kernel*
dtype0
}
-dense_1/kernel/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    *!
_class
loc:@dense_1/kernel*
dtype0
Õ
'dense_1/kernel/Adam_1/Initializer/zerosFill7dense_1/kernel/Adam_1/Initializer/zeros/shape_as_tensor-dense_1/kernel/Adam_1/Initializer/zeros/Const*
T0*

index_type0*!
_class
loc:@dense_1/kernel

dense_1/kernel/Adam_1
VariableV2*
shape:
*
shared_name *!
_class
loc:@dense_1/kernel*
dtype0*
	container 
»
dense_1/kernel/Adam_1/AssignAssigndense_1/kernel/Adam_1'dense_1/kernel/Adam_1/Initializer/zeros*
use_locking(*
T0*!
_class
loc:@dense_1/kernel*
validate_shape(
i
dense_1/kernel/Adam_1/readIdentitydense_1/kernel/Adam_1*
T0*!
_class
loc:@dense_1/kernel
v
#dense_1/bias/Adam/Initializer/zerosConst*
valueB*    *
_class
loc:@dense_1/bias*
dtype0

dense_1/bias/Adam
VariableV2*
shape:*
shared_name *
_class
loc:@dense_1/bias*
dtype0*
	container 
­
dense_1/bias/Adam/AssignAssigndense_1/bias/Adam#dense_1/bias/Adam/Initializer/zeros*
use_locking(*
T0*
_class
loc:@dense_1/bias*
validate_shape(
_
dense_1/bias/Adam/readIdentitydense_1/bias/Adam*
T0*
_class
loc:@dense_1/bias
x
%dense_1/bias/Adam_1/Initializer/zerosConst*
valueB*    *
_class
loc:@dense_1/bias*
dtype0

dense_1/bias/Adam_1
VariableV2*
shape:*
shared_name *
_class
loc:@dense_1/bias*
dtype0*
	container 
³
dense_1/bias/Adam_1/AssignAssigndense_1/bias/Adam_1%dense_1/bias/Adam_1/Initializer/zeros*
use_locking(*
T0*
_class
loc:@dense_1/bias*
validate_shape(
c
dense_1/bias/Adam_1/readIdentitydense_1/bias/Adam_1*
T0*
_class
loc:@dense_1/bias

5dense_2/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
valueB"      *!
_class
loc:@dense_2/kernel*
dtype0
{
+dense_2/kernel/Adam/Initializer/zeros/ConstConst*
valueB
 *    *!
_class
loc:@dense_2/kernel*
dtype0
Ļ
%dense_2/kernel/Adam/Initializer/zerosFill5dense_2/kernel/Adam/Initializer/zeros/shape_as_tensor+dense_2/kernel/Adam/Initializer/zeros/Const*
T0*

index_type0*!
_class
loc:@dense_2/kernel

dense_2/kernel/Adam
VariableV2*
shape:	*
shared_name *!
_class
loc:@dense_2/kernel*
dtype0*
	container 
µ
dense_2/kernel/Adam/AssignAssigndense_2/kernel/Adam%dense_2/kernel/Adam/Initializer/zeros*
use_locking(*
T0*!
_class
loc:@dense_2/kernel*
validate_shape(
e
dense_2/kernel/Adam/readIdentitydense_2/kernel/Adam*
T0*!
_class
loc:@dense_2/kernel

7dense_2/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB"      *!
_class
loc:@dense_2/kernel*
dtype0
}
-dense_2/kernel/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    *!
_class
loc:@dense_2/kernel*
dtype0
Õ
'dense_2/kernel/Adam_1/Initializer/zerosFill7dense_2/kernel/Adam_1/Initializer/zeros/shape_as_tensor-dense_2/kernel/Adam_1/Initializer/zeros/Const*
T0*

index_type0*!
_class
loc:@dense_2/kernel

dense_2/kernel/Adam_1
VariableV2*
shape:	*
shared_name *!
_class
loc:@dense_2/kernel*
dtype0*
	container 
»
dense_2/kernel/Adam_1/AssignAssigndense_2/kernel/Adam_1'dense_2/kernel/Adam_1/Initializer/zeros*
use_locking(*
T0*!
_class
loc:@dense_2/kernel*
validate_shape(
i
dense_2/kernel/Adam_1/readIdentitydense_2/kernel/Adam_1*
T0*!
_class
loc:@dense_2/kernel
u
#dense_2/bias/Adam/Initializer/zerosConst*
valueB*    *
_class
loc:@dense_2/bias*
dtype0

dense_2/bias/Adam
VariableV2*
shape:*
shared_name *
_class
loc:@dense_2/bias*
dtype0*
	container 
­
dense_2/bias/Adam/AssignAssigndense_2/bias/Adam#dense_2/bias/Adam/Initializer/zeros*
use_locking(*
T0*
_class
loc:@dense_2/bias*
validate_shape(
_
dense_2/bias/Adam/readIdentitydense_2/bias/Adam*
T0*
_class
loc:@dense_2/bias
w
%dense_2/bias/Adam_1/Initializer/zerosConst*
valueB*    *
_class
loc:@dense_2/bias*
dtype0

dense_2/bias/Adam_1
VariableV2*
shape:*
shared_name *
_class
loc:@dense_2/bias*
dtype0*
	container 
³
dense_2/bias/Adam_1/AssignAssigndense_2/bias/Adam_1%dense_2/bias/Adam_1/Initializer/zeros*
use_locking(*
T0*
_class
loc:@dense_2/bias*
validate_shape(
c
dense_2/bias/Adam_1/readIdentitydense_2/bias/Adam_1*
T0*
_class
loc:@dense_2/bias

5dense_3/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
valueB"     *!
_class
loc:@dense_3/kernel*
dtype0
{
+dense_3/kernel/Adam/Initializer/zeros/ConstConst*
valueB
 *    *!
_class
loc:@dense_3/kernel*
dtype0
Ļ
%dense_3/kernel/Adam/Initializer/zerosFill5dense_3/kernel/Adam/Initializer/zeros/shape_as_tensor+dense_3/kernel/Adam/Initializer/zeros/Const*
T0*

index_type0*!
_class
loc:@dense_3/kernel

dense_3/kernel/Adam
VariableV2*
shape:
*
shared_name *!
_class
loc:@dense_3/kernel*
dtype0*
	container 
µ
dense_3/kernel/Adam/AssignAssigndense_3/kernel/Adam%dense_3/kernel/Adam/Initializer/zeros*
use_locking(*
T0*!
_class
loc:@dense_3/kernel*
validate_shape(
e
dense_3/kernel/Adam/readIdentitydense_3/kernel/Adam*
T0*!
_class
loc:@dense_3/kernel

7dense_3/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB"     *!
_class
loc:@dense_3/kernel*
dtype0
}
-dense_3/kernel/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    *!
_class
loc:@dense_3/kernel*
dtype0
Õ
'dense_3/kernel/Adam_1/Initializer/zerosFill7dense_3/kernel/Adam_1/Initializer/zeros/shape_as_tensor-dense_3/kernel/Adam_1/Initializer/zeros/Const*
T0*

index_type0*!
_class
loc:@dense_3/kernel

dense_3/kernel/Adam_1
VariableV2*
shape:
*
shared_name *!
_class
loc:@dense_3/kernel*
dtype0*
	container 
»
dense_3/kernel/Adam_1/AssignAssigndense_3/kernel/Adam_1'dense_3/kernel/Adam_1/Initializer/zeros*
use_locking(*
T0*!
_class
loc:@dense_3/kernel*
validate_shape(
i
dense_3/kernel/Adam_1/readIdentitydense_3/kernel/Adam_1*
T0*!
_class
loc:@dense_3/kernel
v
#dense_3/bias/Adam/Initializer/zerosConst*
valueB*    *
_class
loc:@dense_3/bias*
dtype0

dense_3/bias/Adam
VariableV2*
shape:*
shared_name *
_class
loc:@dense_3/bias*
dtype0*
	container 
­
dense_3/bias/Adam/AssignAssigndense_3/bias/Adam#dense_3/bias/Adam/Initializer/zeros*
use_locking(*
T0*
_class
loc:@dense_3/bias*
validate_shape(
_
dense_3/bias/Adam/readIdentitydense_3/bias/Adam*
T0*
_class
loc:@dense_3/bias
x
%dense_3/bias/Adam_1/Initializer/zerosConst*
valueB*    *
_class
loc:@dense_3/bias*
dtype0

dense_3/bias/Adam_1
VariableV2*
shape:*
shared_name *
_class
loc:@dense_3/bias*
dtype0*
	container 
³
dense_3/bias/Adam_1/AssignAssigndense_3/bias/Adam_1%dense_3/bias/Adam_1/Initializer/zeros*
use_locking(*
T0*
_class
loc:@dense_3/bias*
validate_shape(
c
dense_3/bias/Adam_1/readIdentitydense_3/bias/Adam_1*
T0*
_class
loc:@dense_3/bias

5dense_4/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
valueB"      *!
_class
loc:@dense_4/kernel*
dtype0
{
+dense_4/kernel/Adam/Initializer/zeros/ConstConst*
valueB
 *    *!
_class
loc:@dense_4/kernel*
dtype0
Ļ
%dense_4/kernel/Adam/Initializer/zerosFill5dense_4/kernel/Adam/Initializer/zeros/shape_as_tensor+dense_4/kernel/Adam/Initializer/zeros/Const*
T0*

index_type0*!
_class
loc:@dense_4/kernel

dense_4/kernel/Adam
VariableV2*
shape:
*
shared_name *!
_class
loc:@dense_4/kernel*
dtype0*
	container 
µ
dense_4/kernel/Adam/AssignAssigndense_4/kernel/Adam%dense_4/kernel/Adam/Initializer/zeros*
use_locking(*
T0*!
_class
loc:@dense_4/kernel*
validate_shape(
e
dense_4/kernel/Adam/readIdentitydense_4/kernel/Adam*
T0*!
_class
loc:@dense_4/kernel

7dense_4/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB"      *!
_class
loc:@dense_4/kernel*
dtype0
}
-dense_4/kernel/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    *!
_class
loc:@dense_4/kernel*
dtype0
Õ
'dense_4/kernel/Adam_1/Initializer/zerosFill7dense_4/kernel/Adam_1/Initializer/zeros/shape_as_tensor-dense_4/kernel/Adam_1/Initializer/zeros/Const*
T0*

index_type0*!
_class
loc:@dense_4/kernel

dense_4/kernel/Adam_1
VariableV2*
shape:
*
shared_name *!
_class
loc:@dense_4/kernel*
dtype0*
	container 
»
dense_4/kernel/Adam_1/AssignAssigndense_4/kernel/Adam_1'dense_4/kernel/Adam_1/Initializer/zeros*
use_locking(*
T0*!
_class
loc:@dense_4/kernel*
validate_shape(
i
dense_4/kernel/Adam_1/readIdentitydense_4/kernel/Adam_1*
T0*!
_class
loc:@dense_4/kernel
v
#dense_4/bias/Adam/Initializer/zerosConst*
valueB*    *
_class
loc:@dense_4/bias*
dtype0

dense_4/bias/Adam
VariableV2*
shape:*
shared_name *
_class
loc:@dense_4/bias*
dtype0*
	container 
­
dense_4/bias/Adam/AssignAssigndense_4/bias/Adam#dense_4/bias/Adam/Initializer/zeros*
use_locking(*
T0*
_class
loc:@dense_4/bias*
validate_shape(
_
dense_4/bias/Adam/readIdentitydense_4/bias/Adam*
T0*
_class
loc:@dense_4/bias
x
%dense_4/bias/Adam_1/Initializer/zerosConst*
valueB*    *
_class
loc:@dense_4/bias*
dtype0

dense_4/bias/Adam_1
VariableV2*
shape:*
shared_name *
_class
loc:@dense_4/bias*
dtype0*
	container 
³
dense_4/bias/Adam_1/AssignAssigndense_4/bias/Adam_1%dense_4/bias/Adam_1/Initializer/zeros*
use_locking(*
T0*
_class
loc:@dense_4/bias*
validate_shape(
c
dense_4/bias/Adam_1/readIdentitydense_4/bias/Adam_1*
T0*
_class
loc:@dense_4/bias
A
Adam_1/learning_rateConst*
valueB
 *RI9*
dtype0
9
Adam_1/beta1Const*
valueB
 *fff?*
dtype0
9
Adam_1/beta2Const*
valueB
 *w¾?*
dtype0
;
Adam_1/epsilonConst*
valueB
 *wĢ+2*
dtype0
×
DAdam_1/update_curiosity_vector_obs_encoder/hidden_0/kernel/ApplyAdam	ApplyAdam,curiosity_vector_obs_encoder/hidden_0/kernel1curiosity_vector_obs_encoder/hidden_0/kernel/Adam3curiosity_vector_obs_encoder/hidden_0/kernel/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilongradients_2/AddN_11*
use_locking( *
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
use_nesterov( 
Ķ
BAdam_1/update_curiosity_vector_obs_encoder/hidden_0/bias/ApplyAdam	ApplyAdam*curiosity_vector_obs_encoder/hidden_0/bias/curiosity_vector_obs_encoder/hidden_0/bias/Adam1curiosity_vector_obs_encoder/hidden_0/bias/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilongradients_2/AddN_10*
use_locking( *
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
use_nesterov( 
Ö
DAdam_1/update_curiosity_vector_obs_encoder/hidden_1/kernel/ApplyAdam	ApplyAdam,curiosity_vector_obs_encoder/hidden_1/kernel1curiosity_vector_obs_encoder/hidden_1/kernel/Adam3curiosity_vector_obs_encoder/hidden_1/kernel/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilongradients_2/AddN_7*
use_locking( *
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
use_nesterov( 
Ģ
BAdam_1/update_curiosity_vector_obs_encoder/hidden_1/bias/ApplyAdam	ApplyAdam*curiosity_vector_obs_encoder/hidden_1/bias/curiosity_vector_obs_encoder/hidden_1/bias/Adam1curiosity_vector_obs_encoder/hidden_1/bias/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilongradients_2/AddN_6*
use_locking( *
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias*
use_nesterov( 
č
&Adam_1/update_dense_1/kernel/ApplyAdam	ApplyAdamdense_1/kerneldense_1/kernel/Adamdense_1/kernel/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilon:gradients_2/dense_1/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*!
_class
loc:@dense_1/kernel*
use_nesterov( 
ß
$Adam_1/update_dense_1/bias/ApplyAdam	ApplyAdamdense_1/biasdense_1/bias/Adamdense_1/bias/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilon;gradients_2/dense_1/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@dense_1/bias*
use_nesterov( 
č
&Adam_1/update_dense_2/kernel/ApplyAdam	ApplyAdamdense_2/kerneldense_2/kernel/Adamdense_2/kernel/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilon:gradients_2/dense_2/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*!
_class
loc:@dense_2/kernel*
use_nesterov( 
ß
$Adam_1/update_dense_2/bias/ApplyAdam	ApplyAdamdense_2/biasdense_2/bias/Adamdense_2/bias/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilon;gradients_2/dense_2/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@dense_2/bias*
use_nesterov( 
č
&Adam_1/update_dense_3/kernel/ApplyAdam	ApplyAdamdense_3/kerneldense_3/kernel/Adamdense_3/kernel/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilon:gradients_2/dense_3/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*!
_class
loc:@dense_3/kernel*
use_nesterov( 
ß
$Adam_1/update_dense_3/bias/ApplyAdam	ApplyAdamdense_3/biasdense_3/bias/Adamdense_3/bias/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilon;gradients_2/dense_3/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@dense_3/bias*
use_nesterov( 
č
&Adam_1/update_dense_4/kernel/ApplyAdam	ApplyAdamdense_4/kerneldense_4/kernel/Adamdense_4/kernel/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilon:gradients_2/dense_4/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*!
_class
loc:@dense_4/kernel*
use_nesterov( 
ß
$Adam_1/update_dense_4/bias/ApplyAdam	ApplyAdamdense_4/biasdense_4/bias/Adamdense_4/bias/Adam_1beta1_power_1/readbeta2_power_1/readAdam_1/learning_rateAdam_1/beta1Adam_1/beta2Adam_1/epsilon;gradients_2/dense_4/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@dense_4/bias*
use_nesterov( 
Ó

Adam_1/mulMulbeta1_power_1/readAdam_1/beta1C^Adam_1/update_curiosity_vector_obs_encoder/hidden_0/bias/ApplyAdamE^Adam_1/update_curiosity_vector_obs_encoder/hidden_0/kernel/ApplyAdamC^Adam_1/update_curiosity_vector_obs_encoder/hidden_1/bias/ApplyAdamE^Adam_1/update_curiosity_vector_obs_encoder/hidden_1/kernel/ApplyAdam%^Adam_1/update_dense_1/bias/ApplyAdam'^Adam_1/update_dense_1/kernel/ApplyAdam%^Adam_1/update_dense_2/bias/ApplyAdam'^Adam_1/update_dense_2/kernel/ApplyAdam%^Adam_1/update_dense_3/bias/ApplyAdam'^Adam_1/update_dense_3/kernel/ApplyAdam%^Adam_1/update_dense_4/bias/ApplyAdam'^Adam_1/update_dense_4/kernel/ApplyAdam*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias
£
Adam_1/AssignAssignbeta1_power_1
Adam_1/mul*
use_locking( *
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
validate_shape(
Õ
Adam_1/mul_1Mulbeta2_power_1/readAdam_1/beta2C^Adam_1/update_curiosity_vector_obs_encoder/hidden_0/bias/ApplyAdamE^Adam_1/update_curiosity_vector_obs_encoder/hidden_0/kernel/ApplyAdamC^Adam_1/update_curiosity_vector_obs_encoder/hidden_1/bias/ApplyAdamE^Adam_1/update_curiosity_vector_obs_encoder/hidden_1/kernel/ApplyAdam%^Adam_1/update_dense_1/bias/ApplyAdam'^Adam_1/update_dense_1/kernel/ApplyAdam%^Adam_1/update_dense_2/bias/ApplyAdam'^Adam_1/update_dense_2/kernel/ApplyAdam%^Adam_1/update_dense_3/bias/ApplyAdam'^Adam_1/update_dense_3/kernel/ApplyAdam%^Adam_1/update_dense_4/bias/ApplyAdam'^Adam_1/update_dense_4/kernel/ApplyAdam*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias
§
Adam_1/Assign_1Assignbeta2_power_1Adam_1/mul_1*
use_locking( *
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
validate_shape(

Adam_1NoOp^Adam_1/Assign^Adam_1/Assign_1C^Adam_1/update_curiosity_vector_obs_encoder/hidden_0/bias/ApplyAdamE^Adam_1/update_curiosity_vector_obs_encoder/hidden_0/kernel/ApplyAdamC^Adam_1/update_curiosity_vector_obs_encoder/hidden_1/bias/ApplyAdamE^Adam_1/update_curiosity_vector_obs_encoder/hidden_1/kernel/ApplyAdam%^Adam_1/update_dense_1/bias/ApplyAdam'^Adam_1/update_dense_1/kernel/ApplyAdam%^Adam_1/update_dense_2/bias/ApplyAdam'^Adam_1/update_dense_2/kernel/ApplyAdam%^Adam_1/update_dense_3/bias/ApplyAdam'^Adam_1/update_dense_3/kernel/ApplyAdam%^Adam_1/update_dense_4/bias/ApplyAdam'^Adam_1/update_dense_4/kernel/ApplyAdam
A
save/filename/inputConst*
valueB Bmodel*
dtype0
V
save/filenamePlaceholderWithDefaultsave/filename/input*
shape: *
dtype0
M

save/ConstPlaceholderWithDefaultsave/filename*
shape: *
dtype0
Æ
save/SaveV2/tensor_namesConst*ž
valueōBńWBaction_output_shapeBbeta1_powerBbeta1_power_1Bbeta2_powerBbeta2_power_1Bcuriosity_value/biasBcuriosity_value/bias/AdamBcuriosity_value/bias/Adam_1Bcuriosity_value/kernelBcuriosity_value/kernel/AdamBcuriosity_value/kernel/Adam_1B*curiosity_vector_obs_encoder/hidden_0/biasB/curiosity_vector_obs_encoder/hidden_0/bias/AdamB1curiosity_vector_obs_encoder/hidden_0/bias/Adam_1B,curiosity_vector_obs_encoder/hidden_0/kernelB1curiosity_vector_obs_encoder/hidden_0/kernel/AdamB3curiosity_vector_obs_encoder/hidden_0/kernel/Adam_1B*curiosity_vector_obs_encoder/hidden_1/biasB/curiosity_vector_obs_encoder/hidden_1/bias/AdamB1curiosity_vector_obs_encoder/hidden_1/bias/Adam_1B,curiosity_vector_obs_encoder/hidden_1/kernelB1curiosity_vector_obs_encoder/hidden_1/kernel/AdamB3curiosity_vector_obs_encoder/hidden_1/kernel/Adam_1Bdense/kernelBdense/kernel/AdamBdense/kernel/Adam_1Bdense_1/biasBdense_1/bias/AdamBdense_1/bias/Adam_1Bdense_1/kernelBdense_1/kernel/AdamBdense_1/kernel/Adam_1Bdense_2/biasBdense_2/bias/AdamBdense_2/bias/Adam_1Bdense_2/kernelBdense_2/kernel/AdamBdense_2/kernel/Adam_1Bdense_3/biasBdense_3/bias/AdamBdense_3/bias/Adam_1Bdense_3/kernelBdense_3/kernel/AdamBdense_3/kernel/Adam_1Bdense_4/biasBdense_4/bias/AdamBdense_4/bias/Adam_1Bdense_4/kernelBdense_4/kernel/AdamBdense_4/kernel/Adam_1Bextrinsic_value/biasBextrinsic_value/bias/AdamBextrinsic_value/bias/Adam_1Bextrinsic_value/kernelBextrinsic_value/kernel/AdamBextrinsic_value/kernel/Adam_1Bglobal_stepBis_continuous_controlBmain_graph_0/hidden_0/biasBmain_graph_0/hidden_0/bias/AdamB!main_graph_0/hidden_0/bias/Adam_1Bmain_graph_0/hidden_0/kernelB!main_graph_0/hidden_0/kernel/AdamB#main_graph_0/hidden_0/kernel/Adam_1Bmain_graph_0/hidden_1/biasBmain_graph_0/hidden_1/bias/AdamB!main_graph_0/hidden_1/bias/Adam_1Bmain_graph_0/hidden_1/kernelB!main_graph_0/hidden_1/kernel/AdamB#main_graph_0/hidden_1/kernel/Adam_1Bmain_graph_0/hidden_2/biasBmain_graph_0/hidden_2/bias/AdamB!main_graph_0/hidden_2/bias/Adam_1Bmain_graph_0/hidden_2/kernelB!main_graph_0/hidden_2/kernel/AdamB#main_graph_0/hidden_2/kernel/Adam_1Bmain_graph_0/hidden_3/biasBmain_graph_0/hidden_3/bias/AdamB!main_graph_0/hidden_3/bias/Adam_1Bmain_graph_0/hidden_3/kernelB!main_graph_0/hidden_3/kernel/AdamB#main_graph_0/hidden_3/kernel/Adam_1Bmemory_sizeBnormalization_stepsBrunning_meanBrunning_varianceBversion_number*
dtype0
ų
save/SaveV2/shape_and_slicesConst*Ć
value¹B¶WB B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0
©
save/SaveV2SaveV2
save/Constsave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesaction_output_shapebeta1_powerbeta1_power_1beta2_powerbeta2_power_1curiosity_value/biascuriosity_value/bias/Adamcuriosity_value/bias/Adam_1curiosity_value/kernelcuriosity_value/kernel/Adamcuriosity_value/kernel/Adam_1*curiosity_vector_obs_encoder/hidden_0/bias/curiosity_vector_obs_encoder/hidden_0/bias/Adam1curiosity_vector_obs_encoder/hidden_0/bias/Adam_1,curiosity_vector_obs_encoder/hidden_0/kernel1curiosity_vector_obs_encoder/hidden_0/kernel/Adam3curiosity_vector_obs_encoder/hidden_0/kernel/Adam_1*curiosity_vector_obs_encoder/hidden_1/bias/curiosity_vector_obs_encoder/hidden_1/bias/Adam1curiosity_vector_obs_encoder/hidden_1/bias/Adam_1,curiosity_vector_obs_encoder/hidden_1/kernel1curiosity_vector_obs_encoder/hidden_1/kernel/Adam3curiosity_vector_obs_encoder/hidden_1/kernel/Adam_1dense/kerneldense/kernel/Adamdense/kernel/Adam_1dense_1/biasdense_1/bias/Adamdense_1/bias/Adam_1dense_1/kerneldense_1/kernel/Adamdense_1/kernel/Adam_1dense_2/biasdense_2/bias/Adamdense_2/bias/Adam_1dense_2/kerneldense_2/kernel/Adamdense_2/kernel/Adam_1dense_3/biasdense_3/bias/Adamdense_3/bias/Adam_1dense_3/kerneldense_3/kernel/Adamdense_3/kernel/Adam_1dense_4/biasdense_4/bias/Adamdense_4/bias/Adam_1dense_4/kerneldense_4/kernel/Adamdense_4/kernel/Adam_1extrinsic_value/biasextrinsic_value/bias/Adamextrinsic_value/bias/Adam_1extrinsic_value/kernelextrinsic_value/kernel/Adamextrinsic_value/kernel/Adam_1global_stepis_continuous_controlmain_graph_0/hidden_0/biasmain_graph_0/hidden_0/bias/Adam!main_graph_0/hidden_0/bias/Adam_1main_graph_0/hidden_0/kernel!main_graph_0/hidden_0/kernel/Adam#main_graph_0/hidden_0/kernel/Adam_1main_graph_0/hidden_1/biasmain_graph_0/hidden_1/bias/Adam!main_graph_0/hidden_1/bias/Adam_1main_graph_0/hidden_1/kernel!main_graph_0/hidden_1/kernel/Adam#main_graph_0/hidden_1/kernel/Adam_1main_graph_0/hidden_2/biasmain_graph_0/hidden_2/bias/Adam!main_graph_0/hidden_2/bias/Adam_1main_graph_0/hidden_2/kernel!main_graph_0/hidden_2/kernel/Adam#main_graph_0/hidden_2/kernel/Adam_1main_graph_0/hidden_3/biasmain_graph_0/hidden_3/bias/Adam!main_graph_0/hidden_3/bias/Adam_1main_graph_0/hidden_3/kernel!main_graph_0/hidden_3/kernel/Adam#main_graph_0/hidden_3/kernel/Adam_1memory_sizenormalization_stepsrunning_meanrunning_varianceversion_number*e
dtypes[
Y2W
e
save/control_dependencyIdentity
save/Const^save/SaveV2*
T0*
_class
loc:@save/Const
Į
save/RestoreV2/tensor_namesConst"/device:CPU:0*ž
valueōBńWBaction_output_shapeBbeta1_powerBbeta1_power_1Bbeta2_powerBbeta2_power_1Bcuriosity_value/biasBcuriosity_value/bias/AdamBcuriosity_value/bias/Adam_1Bcuriosity_value/kernelBcuriosity_value/kernel/AdamBcuriosity_value/kernel/Adam_1B*curiosity_vector_obs_encoder/hidden_0/biasB/curiosity_vector_obs_encoder/hidden_0/bias/AdamB1curiosity_vector_obs_encoder/hidden_0/bias/Adam_1B,curiosity_vector_obs_encoder/hidden_0/kernelB1curiosity_vector_obs_encoder/hidden_0/kernel/AdamB3curiosity_vector_obs_encoder/hidden_0/kernel/Adam_1B*curiosity_vector_obs_encoder/hidden_1/biasB/curiosity_vector_obs_encoder/hidden_1/bias/AdamB1curiosity_vector_obs_encoder/hidden_1/bias/Adam_1B,curiosity_vector_obs_encoder/hidden_1/kernelB1curiosity_vector_obs_encoder/hidden_1/kernel/AdamB3curiosity_vector_obs_encoder/hidden_1/kernel/Adam_1Bdense/kernelBdense/kernel/AdamBdense/kernel/Adam_1Bdense_1/biasBdense_1/bias/AdamBdense_1/bias/Adam_1Bdense_1/kernelBdense_1/kernel/AdamBdense_1/kernel/Adam_1Bdense_2/biasBdense_2/bias/AdamBdense_2/bias/Adam_1Bdense_2/kernelBdense_2/kernel/AdamBdense_2/kernel/Adam_1Bdense_3/biasBdense_3/bias/AdamBdense_3/bias/Adam_1Bdense_3/kernelBdense_3/kernel/AdamBdense_3/kernel/Adam_1Bdense_4/biasBdense_4/bias/AdamBdense_4/bias/Adam_1Bdense_4/kernelBdense_4/kernel/AdamBdense_4/kernel/Adam_1Bextrinsic_value/biasBextrinsic_value/bias/AdamBextrinsic_value/bias/Adam_1Bextrinsic_value/kernelBextrinsic_value/kernel/AdamBextrinsic_value/kernel/Adam_1Bglobal_stepBis_continuous_controlBmain_graph_0/hidden_0/biasBmain_graph_0/hidden_0/bias/AdamB!main_graph_0/hidden_0/bias/Adam_1Bmain_graph_0/hidden_0/kernelB!main_graph_0/hidden_0/kernel/AdamB#main_graph_0/hidden_0/kernel/Adam_1Bmain_graph_0/hidden_1/biasBmain_graph_0/hidden_1/bias/AdamB!main_graph_0/hidden_1/bias/Adam_1Bmain_graph_0/hidden_1/kernelB!main_graph_0/hidden_1/kernel/AdamB#main_graph_0/hidden_1/kernel/Adam_1Bmain_graph_0/hidden_2/biasBmain_graph_0/hidden_2/bias/AdamB!main_graph_0/hidden_2/bias/Adam_1Bmain_graph_0/hidden_2/kernelB!main_graph_0/hidden_2/kernel/AdamB#main_graph_0/hidden_2/kernel/Adam_1Bmain_graph_0/hidden_3/biasBmain_graph_0/hidden_3/bias/AdamB!main_graph_0/hidden_3/bias/Adam_1Bmain_graph_0/hidden_3/kernelB!main_graph_0/hidden_3/kernel/AdamB#main_graph_0/hidden_3/kernel/Adam_1Bmemory_sizeBnormalization_stepsBrunning_meanBrunning_varianceBversion_number*
dtype0

save/RestoreV2/shape_and_slicesConst"/device:CPU:0*Ć
value¹B¶WB B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0
Ū
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*e
dtypes[
Y2W

save/AssignAssignaction_output_shapesave/RestoreV2*
use_locking(*
T0*&
_class
loc:@action_output_shape*
validate_shape(

save/Assign_1Assignbeta1_powersave/RestoreV2:1*
use_locking(*
T0*'
_class
loc:@curiosity_value/bias*
validate_shape(
©
save/Assign_2Assignbeta1_power_1save/RestoreV2:2*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
validate_shape(

save/Assign_3Assignbeta2_powersave/RestoreV2:3*
use_locking(*
T0*'
_class
loc:@curiosity_value/bias*
validate_shape(
©
save/Assign_4Assignbeta2_power_1save/RestoreV2:4*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
validate_shape(

save/Assign_5Assigncuriosity_value/biassave/RestoreV2:5*
use_locking(*
T0*'
_class
loc:@curiosity_value/bias*
validate_shape(

save/Assign_6Assigncuriosity_value/bias/Adamsave/RestoreV2:6*
use_locking(*
T0*'
_class
loc:@curiosity_value/bias*
validate_shape(
”
save/Assign_7Assigncuriosity_value/bias/Adam_1save/RestoreV2:7*
use_locking(*
T0*'
_class
loc:@curiosity_value/bias*
validate_shape(

save/Assign_8Assigncuriosity_value/kernelsave/RestoreV2:8*
use_locking(*
T0*)
_class
loc:@curiosity_value/kernel*
validate_shape(
£
save/Assign_9Assigncuriosity_value/kernel/Adamsave/RestoreV2:9*
use_locking(*
T0*)
_class
loc:@curiosity_value/kernel*
validate_shape(
§
save/Assign_10Assigncuriosity_value/kernel/Adam_1save/RestoreV2:10*
use_locking(*
T0*)
_class
loc:@curiosity_value/kernel*
validate_shape(
Č
save/Assign_11Assign*curiosity_vector_obs_encoder/hidden_0/biassave/RestoreV2:11*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
validate_shape(
Ķ
save/Assign_12Assign/curiosity_vector_obs_encoder/hidden_0/bias/Adamsave/RestoreV2:12*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
validate_shape(
Ļ
save/Assign_13Assign1curiosity_vector_obs_encoder/hidden_0/bias/Adam_1save/RestoreV2:13*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
validate_shape(
Ģ
save/Assign_14Assign,curiosity_vector_obs_encoder/hidden_0/kernelsave/RestoreV2:14*
use_locking(*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
validate_shape(
Ń
save/Assign_15Assign1curiosity_vector_obs_encoder/hidden_0/kernel/Adamsave/RestoreV2:15*
use_locking(*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
validate_shape(
Ó
save/Assign_16Assign3curiosity_vector_obs_encoder/hidden_0/kernel/Adam_1save/RestoreV2:16*
use_locking(*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
validate_shape(
Č
save/Assign_17Assign*curiosity_vector_obs_encoder/hidden_1/biassave/RestoreV2:17*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias*
validate_shape(
Ķ
save/Assign_18Assign/curiosity_vector_obs_encoder/hidden_1/bias/Adamsave/RestoreV2:18*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias*
validate_shape(
Ļ
save/Assign_19Assign1curiosity_vector_obs_encoder/hidden_1/bias/Adam_1save/RestoreV2:19*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias*
validate_shape(
Ģ
save/Assign_20Assign,curiosity_vector_obs_encoder/hidden_1/kernelsave/RestoreV2:20*
use_locking(*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
validate_shape(
Ń
save/Assign_21Assign1curiosity_vector_obs_encoder/hidden_1/kernel/Adamsave/RestoreV2:21*
use_locking(*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
validate_shape(
Ó
save/Assign_22Assign3curiosity_vector_obs_encoder/hidden_1/kernel/Adam_1save/RestoreV2:22*
use_locking(*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
validate_shape(

save/Assign_23Assigndense/kernelsave/RestoreV2:23*
use_locking(*
T0*
_class
loc:@dense/kernel*
validate_shape(

save/Assign_24Assigndense/kernel/Adamsave/RestoreV2:24*
use_locking(*
T0*
_class
loc:@dense/kernel*
validate_shape(

save/Assign_25Assigndense/kernel/Adam_1save/RestoreV2:25*
use_locking(*
T0*
_class
loc:@dense/kernel*
validate_shape(

save/Assign_26Assigndense_1/biassave/RestoreV2:26*
use_locking(*
T0*
_class
loc:@dense_1/bias*
validate_shape(

save/Assign_27Assigndense_1/bias/Adamsave/RestoreV2:27*
use_locking(*
T0*
_class
loc:@dense_1/bias*
validate_shape(

save/Assign_28Assigndense_1/bias/Adam_1save/RestoreV2:28*
use_locking(*
T0*
_class
loc:@dense_1/bias*
validate_shape(

save/Assign_29Assigndense_1/kernelsave/RestoreV2:29*
use_locking(*
T0*!
_class
loc:@dense_1/kernel*
validate_shape(

save/Assign_30Assigndense_1/kernel/Adamsave/RestoreV2:30*
use_locking(*
T0*!
_class
loc:@dense_1/kernel*
validate_shape(

save/Assign_31Assigndense_1/kernel/Adam_1save/RestoreV2:31*
use_locking(*
T0*!
_class
loc:@dense_1/kernel*
validate_shape(

save/Assign_32Assigndense_2/biassave/RestoreV2:32*
use_locking(*
T0*
_class
loc:@dense_2/bias*
validate_shape(

save/Assign_33Assigndense_2/bias/Adamsave/RestoreV2:33*
use_locking(*
T0*
_class
loc:@dense_2/bias*
validate_shape(

save/Assign_34Assigndense_2/bias/Adam_1save/RestoreV2:34*
use_locking(*
T0*
_class
loc:@dense_2/bias*
validate_shape(

save/Assign_35Assigndense_2/kernelsave/RestoreV2:35*
use_locking(*
T0*!
_class
loc:@dense_2/kernel*
validate_shape(

save/Assign_36Assigndense_2/kernel/Adamsave/RestoreV2:36*
use_locking(*
T0*!
_class
loc:@dense_2/kernel*
validate_shape(

save/Assign_37Assigndense_2/kernel/Adam_1save/RestoreV2:37*
use_locking(*
T0*!
_class
loc:@dense_2/kernel*
validate_shape(

save/Assign_38Assigndense_3/biassave/RestoreV2:38*
use_locking(*
T0*
_class
loc:@dense_3/bias*
validate_shape(

save/Assign_39Assigndense_3/bias/Adamsave/RestoreV2:39*
use_locking(*
T0*
_class
loc:@dense_3/bias*
validate_shape(

save/Assign_40Assigndense_3/bias/Adam_1save/RestoreV2:40*
use_locking(*
T0*
_class
loc:@dense_3/bias*
validate_shape(

save/Assign_41Assigndense_3/kernelsave/RestoreV2:41*
use_locking(*
T0*!
_class
loc:@dense_3/kernel*
validate_shape(

save/Assign_42Assigndense_3/kernel/Adamsave/RestoreV2:42*
use_locking(*
T0*!
_class
loc:@dense_3/kernel*
validate_shape(

save/Assign_43Assigndense_3/kernel/Adam_1save/RestoreV2:43*
use_locking(*
T0*!
_class
loc:@dense_3/kernel*
validate_shape(

save/Assign_44Assigndense_4/biassave/RestoreV2:44*
use_locking(*
T0*
_class
loc:@dense_4/bias*
validate_shape(

save/Assign_45Assigndense_4/bias/Adamsave/RestoreV2:45*
use_locking(*
T0*
_class
loc:@dense_4/bias*
validate_shape(

save/Assign_46Assigndense_4/bias/Adam_1save/RestoreV2:46*
use_locking(*
T0*
_class
loc:@dense_4/bias*
validate_shape(

save/Assign_47Assigndense_4/kernelsave/RestoreV2:47*
use_locking(*
T0*!
_class
loc:@dense_4/kernel*
validate_shape(

save/Assign_48Assigndense_4/kernel/Adamsave/RestoreV2:48*
use_locking(*
T0*!
_class
loc:@dense_4/kernel*
validate_shape(

save/Assign_49Assigndense_4/kernel/Adam_1save/RestoreV2:49*
use_locking(*
T0*!
_class
loc:@dense_4/kernel*
validate_shape(

save/Assign_50Assignextrinsic_value/biassave/RestoreV2:50*
use_locking(*
T0*'
_class
loc:@extrinsic_value/bias*
validate_shape(
”
save/Assign_51Assignextrinsic_value/bias/Adamsave/RestoreV2:51*
use_locking(*
T0*'
_class
loc:@extrinsic_value/bias*
validate_shape(
£
save/Assign_52Assignextrinsic_value/bias/Adam_1save/RestoreV2:52*
use_locking(*
T0*'
_class
loc:@extrinsic_value/bias*
validate_shape(
 
save/Assign_53Assignextrinsic_value/kernelsave/RestoreV2:53*
use_locking(*
T0*)
_class
loc:@extrinsic_value/kernel*
validate_shape(
„
save/Assign_54Assignextrinsic_value/kernel/Adamsave/RestoreV2:54*
use_locking(*
T0*)
_class
loc:@extrinsic_value/kernel*
validate_shape(
§
save/Assign_55Assignextrinsic_value/kernel/Adam_1save/RestoreV2:55*
use_locking(*
T0*)
_class
loc:@extrinsic_value/kernel*
validate_shape(

save/Assign_56Assignglobal_stepsave/RestoreV2:56*
use_locking(*
T0*
_class
loc:@global_step*
validate_shape(

save/Assign_57Assignis_continuous_controlsave/RestoreV2:57*
use_locking(*
T0*(
_class
loc:@is_continuous_control*
validate_shape(
Ø
save/Assign_58Assignmain_graph_0/hidden_0/biassave/RestoreV2:58*
use_locking(*
T0*-
_class#
!loc:@main_graph_0/hidden_0/bias*
validate_shape(
­
save/Assign_59Assignmain_graph_0/hidden_0/bias/Adamsave/RestoreV2:59*
use_locking(*
T0*-
_class#
!loc:@main_graph_0/hidden_0/bias*
validate_shape(
Æ
save/Assign_60Assign!main_graph_0/hidden_0/bias/Adam_1save/RestoreV2:60*
use_locking(*
T0*-
_class#
!loc:@main_graph_0/hidden_0/bias*
validate_shape(
¬
save/Assign_61Assignmain_graph_0/hidden_0/kernelsave/RestoreV2:61*
use_locking(*
T0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel*
validate_shape(
±
save/Assign_62Assign!main_graph_0/hidden_0/kernel/Adamsave/RestoreV2:62*
use_locking(*
T0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel*
validate_shape(
³
save/Assign_63Assign#main_graph_0/hidden_0/kernel/Adam_1save/RestoreV2:63*
use_locking(*
T0*/
_class%
#!loc:@main_graph_0/hidden_0/kernel*
validate_shape(
Ø
save/Assign_64Assignmain_graph_0/hidden_1/biassave/RestoreV2:64*
use_locking(*
T0*-
_class#
!loc:@main_graph_0/hidden_1/bias*
validate_shape(
­
save/Assign_65Assignmain_graph_0/hidden_1/bias/Adamsave/RestoreV2:65*
use_locking(*
T0*-
_class#
!loc:@main_graph_0/hidden_1/bias*
validate_shape(
Æ
save/Assign_66Assign!main_graph_0/hidden_1/bias/Adam_1save/RestoreV2:66*
use_locking(*
T0*-
_class#
!loc:@main_graph_0/hidden_1/bias*
validate_shape(
¬
save/Assign_67Assignmain_graph_0/hidden_1/kernelsave/RestoreV2:67*
use_locking(*
T0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel*
validate_shape(
±
save/Assign_68Assign!main_graph_0/hidden_1/kernel/Adamsave/RestoreV2:68*
use_locking(*
T0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel*
validate_shape(
³
save/Assign_69Assign#main_graph_0/hidden_1/kernel/Adam_1save/RestoreV2:69*
use_locking(*
T0*/
_class%
#!loc:@main_graph_0/hidden_1/kernel*
validate_shape(
Ø
save/Assign_70Assignmain_graph_0/hidden_2/biassave/RestoreV2:70*
use_locking(*
T0*-
_class#
!loc:@main_graph_0/hidden_2/bias*
validate_shape(
­
save/Assign_71Assignmain_graph_0/hidden_2/bias/Adamsave/RestoreV2:71*
use_locking(*
T0*-
_class#
!loc:@main_graph_0/hidden_2/bias*
validate_shape(
Æ
save/Assign_72Assign!main_graph_0/hidden_2/bias/Adam_1save/RestoreV2:72*
use_locking(*
T0*-
_class#
!loc:@main_graph_0/hidden_2/bias*
validate_shape(
¬
save/Assign_73Assignmain_graph_0/hidden_2/kernelsave/RestoreV2:73*
use_locking(*
T0*/
_class%
#!loc:@main_graph_0/hidden_2/kernel*
validate_shape(
±
save/Assign_74Assign!main_graph_0/hidden_2/kernel/Adamsave/RestoreV2:74*
use_locking(*
T0*/
_class%
#!loc:@main_graph_0/hidden_2/kernel*
validate_shape(
³
save/Assign_75Assign#main_graph_0/hidden_2/kernel/Adam_1save/RestoreV2:75*
use_locking(*
T0*/
_class%
#!loc:@main_graph_0/hidden_2/kernel*
validate_shape(
Ø
save/Assign_76Assignmain_graph_0/hidden_3/biassave/RestoreV2:76*
use_locking(*
T0*-
_class#
!loc:@main_graph_0/hidden_3/bias*
validate_shape(
­
save/Assign_77Assignmain_graph_0/hidden_3/bias/Adamsave/RestoreV2:77*
use_locking(*
T0*-
_class#
!loc:@main_graph_0/hidden_3/bias*
validate_shape(
Æ
save/Assign_78Assign!main_graph_0/hidden_3/bias/Adam_1save/RestoreV2:78*
use_locking(*
T0*-
_class#
!loc:@main_graph_0/hidden_3/bias*
validate_shape(
¬
save/Assign_79Assignmain_graph_0/hidden_3/kernelsave/RestoreV2:79*
use_locking(*
T0*/
_class%
#!loc:@main_graph_0/hidden_3/kernel*
validate_shape(
±
save/Assign_80Assign!main_graph_0/hidden_3/kernel/Adamsave/RestoreV2:80*
use_locking(*
T0*/
_class%
#!loc:@main_graph_0/hidden_3/kernel*
validate_shape(
³
save/Assign_81Assign#main_graph_0/hidden_3/kernel/Adam_1save/RestoreV2:81*
use_locking(*
T0*/
_class%
#!loc:@main_graph_0/hidden_3/kernel*
validate_shape(

save/Assign_82Assignmemory_sizesave/RestoreV2:82*
use_locking(*
T0*
_class
loc:@memory_size*
validate_shape(

save/Assign_83Assignnormalization_stepssave/RestoreV2:83*
use_locking(*
T0*&
_class
loc:@normalization_steps*
validate_shape(

save/Assign_84Assignrunning_meansave/RestoreV2:84*
use_locking(*
T0*
_class
loc:@running_mean*
validate_shape(

save/Assign_85Assignrunning_variancesave/RestoreV2:85*
use_locking(*
T0*#
_class
loc:@running_variance*
validate_shape(

save/Assign_86Assignversion_numbersave/RestoreV2:86*
use_locking(*
T0*!
_class
loc:@version_number*
validate_shape(
Ó
save/restore_allNoOp^save/Assign^save/Assign_1^save/Assign_10^save/Assign_11^save/Assign_12^save/Assign_13^save/Assign_14^save/Assign_15^save/Assign_16^save/Assign_17^save/Assign_18^save/Assign_19^save/Assign_2^save/Assign_20^save/Assign_21^save/Assign_22^save/Assign_23^save/Assign_24^save/Assign_25^save/Assign_26^save/Assign_27^save/Assign_28^save/Assign_29^save/Assign_3^save/Assign_30^save/Assign_31^save/Assign_32^save/Assign_33^save/Assign_34^save/Assign_35^save/Assign_36^save/Assign_37^save/Assign_38^save/Assign_39^save/Assign_4^save/Assign_40^save/Assign_41^save/Assign_42^save/Assign_43^save/Assign_44^save/Assign_45^save/Assign_46^save/Assign_47^save/Assign_48^save/Assign_49^save/Assign_5^save/Assign_50^save/Assign_51^save/Assign_52^save/Assign_53^save/Assign_54^save/Assign_55^save/Assign_56^save/Assign_57^save/Assign_58^save/Assign_59^save/Assign_6^save/Assign_60^save/Assign_61^save/Assign_62^save/Assign_63^save/Assign_64^save/Assign_65^save/Assign_66^save/Assign_67^save/Assign_68^save/Assign_69^save/Assign_7^save/Assign_70^save/Assign_71^save/Assign_72^save/Assign_73^save/Assign_74^save/Assign_75^save/Assign_76^save/Assign_77^save/Assign_78^save/Assign_79^save/Assign_8^save/Assign_80^save/Assign_81^save/Assign_82^save/Assign_83^save/Assign_84^save/Assign_85^save/Assign_86^save/Assign_9
­
initNoOp^action_output_shape/Assign^beta1_power/Assign^beta1_power_1/Assign^beta2_power/Assign^beta2_power_1/Assign!^curiosity_value/bias/Adam/Assign#^curiosity_value/bias/Adam_1/Assign^curiosity_value/bias/Assign#^curiosity_value/kernel/Adam/Assign%^curiosity_value/kernel/Adam_1/Assign^curiosity_value/kernel/Assign7^curiosity_vector_obs_encoder/hidden_0/bias/Adam/Assign9^curiosity_vector_obs_encoder/hidden_0/bias/Adam_1/Assign2^curiosity_vector_obs_encoder/hidden_0/bias/Assign9^curiosity_vector_obs_encoder/hidden_0/kernel/Adam/Assign;^curiosity_vector_obs_encoder/hidden_0/kernel/Adam_1/Assign4^curiosity_vector_obs_encoder/hidden_0/kernel/Assign7^curiosity_vector_obs_encoder/hidden_1/bias/Adam/Assign9^curiosity_vector_obs_encoder/hidden_1/bias/Adam_1/Assign2^curiosity_vector_obs_encoder/hidden_1/bias/Assign9^curiosity_vector_obs_encoder/hidden_1/kernel/Adam/Assign;^curiosity_vector_obs_encoder/hidden_1/kernel/Adam_1/Assign4^curiosity_vector_obs_encoder/hidden_1/kernel/Assign^dense/kernel/Adam/Assign^dense/kernel/Adam_1/Assign^dense/kernel/Assign^dense_1/bias/Adam/Assign^dense_1/bias/Adam_1/Assign^dense_1/bias/Assign^dense_1/kernel/Adam/Assign^dense_1/kernel/Adam_1/Assign^dense_1/kernel/Assign^dense_2/bias/Adam/Assign^dense_2/bias/Adam_1/Assign^dense_2/bias/Assign^dense_2/kernel/Adam/Assign^dense_2/kernel/Adam_1/Assign^dense_2/kernel/Assign^dense_3/bias/Adam/Assign^dense_3/bias/Adam_1/Assign^dense_3/bias/Assign^dense_3/kernel/Adam/Assign^dense_3/kernel/Adam_1/Assign^dense_3/kernel/Assign^dense_4/bias/Adam/Assign^dense_4/bias/Adam_1/Assign^dense_4/bias/Assign^dense_4/kernel/Adam/Assign^dense_4/kernel/Adam_1/Assign^dense_4/kernel/Assign!^extrinsic_value/bias/Adam/Assign#^extrinsic_value/bias/Adam_1/Assign^extrinsic_value/bias/Assign#^extrinsic_value/kernel/Adam/Assign%^extrinsic_value/kernel/Adam_1/Assign^extrinsic_value/kernel/Assign^global_step/Assign^is_continuous_control/Assign'^main_graph_0/hidden_0/bias/Adam/Assign)^main_graph_0/hidden_0/bias/Adam_1/Assign"^main_graph_0/hidden_0/bias/Assign)^main_graph_0/hidden_0/kernel/Adam/Assign+^main_graph_0/hidden_0/kernel/Adam_1/Assign$^main_graph_0/hidden_0/kernel/Assign'^main_graph_0/hidden_1/bias/Adam/Assign)^main_graph_0/hidden_1/bias/Adam_1/Assign"^main_graph_0/hidden_1/bias/Assign)^main_graph_0/hidden_1/kernel/Adam/Assign+^main_graph_0/hidden_1/kernel/Adam_1/Assign$^main_graph_0/hidden_1/kernel/Assign'^main_graph_0/hidden_2/bias/Adam/Assign)^main_graph_0/hidden_2/bias/Adam_1/Assign"^main_graph_0/hidden_2/bias/Assign)^main_graph_0/hidden_2/kernel/Adam/Assign+^main_graph_0/hidden_2/kernel/Adam_1/Assign$^main_graph_0/hidden_2/kernel/Assign'^main_graph_0/hidden_3/bias/Adam/Assign)^main_graph_0/hidden_3/bias/Adam_1/Assign"^main_graph_0/hidden_3/bias/Assign)^main_graph_0/hidden_3/kernel/Adam/Assign+^main_graph_0/hidden_3/kernel/Adam_1/Assign$^main_graph_0/hidden_3/kernel/Assign^memory_size/Assign^normalization_steps/Assign^running_mean/Assign^running_variance/Assign^version_number/Assign"w