import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean

structure CStarDynamicalSystem where
  carrier : Type u
  norm : carrier → ℝ
  mul : carrier → carrier → carrier
  inv : carrier → carrier
  star : carrier → carrier
  zero : carrier
  one : carrier
  normedAlgebra : Prop
  CStarIdentity : Prop
  complete : Prop
  normedAlgebraTerm : normedAlgebra
  CStarIdentityTerm : CStarIdentity
  completeTerm : complete

structure CStarDynamicalSystemEvidence (A : CStarDynamicalSystem) where
  normedAlgebraClosed : A.normedAlgebra
  CStarIdentityClosed : A.CStarIdentity
  completeClosed : A.complete

def CStarDynamicalSystemClosed (A : CStarDynamicalSystem) : Prop :=
  A.normedAlgebra ∧ A.CStarIdentity ∧ A.complete

theorem cstar_dynamical_system_closed_from_evidence (A : CStarDynamicalSystem)
    (E : CStarDynamicalSystemEvidence A) : CStarDynamicalSystemClosed A := by
  exact And.intro E.normedAlgebraClosed (And.intro E.CStarIdentityClosed E.completeClosed)

end DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse