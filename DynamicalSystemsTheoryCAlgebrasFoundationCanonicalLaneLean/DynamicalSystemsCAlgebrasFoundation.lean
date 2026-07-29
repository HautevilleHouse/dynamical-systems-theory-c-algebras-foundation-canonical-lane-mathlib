import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean

structure DynamicalSystemCAlgebra where
  carrier : Type u
  algebraStructure : Type v
  dynamics : carrier → carrier
  invariantStates : Prop
  ergodicProperties : Prop
  cAlgebraTraces : Prop

structure DynamicalSystemCAlgebraEvidence (D : DynamicalSystemCAlgebra) where
  invariantStatesClosed : D.invariantStates
  ergodicPropertiesClosed : D.ergodicProperties
  cAlgebraTracesClosed : D.cAlgebraTraces

def DynamicalSystemCAlgebraClosed (D : DynamicalSystemCAlgebra) : Prop :=
  D.invariantStates ∧ D.ergodicProperties ∧ D.cAlgebraTraces

theorem dynamical_system_c_algebra_closed_from_evidence
    (D : DynamicalSystemCAlgebra) (E : DynamicalSystemCAlgebraEvidence D) :
    DynamicalSystemCAlgebraClosed D := by
  exact And.intro E.invariantStatesClosed (And.intro E.ergodicPropertiesClosed E.cAlgebraTracesClosed)

end DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse