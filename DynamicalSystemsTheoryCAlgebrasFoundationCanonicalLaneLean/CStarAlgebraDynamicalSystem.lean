import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean

structure CStarAlgebraPackage where
  carrier : Type u
  norm : carrier → ℝ
  involution : carrier → carrier
  multiplication : carrier → carrier → carrier
  addition : carrier → carrier → carrier
  zero : carrier
  one : carrier
  CStarIdentity : ∀ x, ‖x * x†‖ = ‖x‖^2
  BanachAlgebra : Prop

structure CStarAlgebraEvidence (A : CStarAlgebraPackage) where
  CStarIdentityClosed : A.CStarIdentity
  BanachAlgebraClosed : A.BanachAlgebra

def CStarAlgebraClosed (A : CStarAlgebraPackage) : Prop :=
  A.CStarIdentity ∧ A.BanachAlgebra

theorem cstar_algebra_closed_from_evidence (A : CStarAlgebraPackage) (E : CStarAlgebraEvidence A) :
    CStarAlgebraClosed A := by
  exact And.intro E.CStarIdentityClosed E.BanachAlgebraClosed

end DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse