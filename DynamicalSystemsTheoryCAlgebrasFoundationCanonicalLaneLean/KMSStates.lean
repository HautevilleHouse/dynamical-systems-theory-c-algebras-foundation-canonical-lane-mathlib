import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean.CStarCrossedProduct

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean

structure TimeEvolution (A : CStarAlgebra ℂ) where
  oneParameterGroup : ℝ → A.carrier → A.carrier
  isAutomorphism : ∀ t : ℝ, IsAutomorphism (oneParameterGroup t)
  isStronglyContinuous : Prop

structure KMSState {A : CStarAlgebra ℂ} (α : TimeEvolution A) (β : ℝ) where
  state : A.carrier → ℂ
  positive : ∀ x : A.carrier, state (x * star x) ≥ 0
  normalized : state (A.unit) = 1
  tracial : Prop
  KMScondition : ∀ x y : A.carrier, state (x * y) = state (y * α.oneParameterGroup (Complex.I * β) x)
  KMSconditionClosed : KMScondition

structure KMSStateEvidence {A : CStarAlgebra ℂ} {α : TimeEvolution A} {β : ℝ} (S : KMSState α β) where
  tracialClosed : S.tracial

def KMSStateClosed {A : CStarAlgebra ℂ} {α : TimeEvolution A} {β : ℝ} (S : KMSState α β) : Prop :=
  S.KMScondition ∧ S.tracial

theorem kms_state_closed_from_evidence {A : CStarAlgebra ℂ} {α : TimeEvolution A} {β : ℝ} (S : KMSState α β) (E : KMSStateEvidence S) : KMSStateClosed S := by
  exact And.intro S.KMSconditionClosed E.tracialClosed

end DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse