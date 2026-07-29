import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean

def ConstrainedDynamicalSystemsCAlgebrasClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_dynamical_systems_c_algebras_endgame (A : AdmissibleClass) :
    ConstrainedDynamicalSystemsCAlgebrasClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse