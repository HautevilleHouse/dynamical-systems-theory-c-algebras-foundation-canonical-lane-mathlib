import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean

structure KMSStatePackage (A : CStarAlgebraPackage) (α : ℝ → A.carrier → A.carrier) where
  state : A.carrier → ℂ
  positivity : ∀ x, state (A.multiplication x (A.involution x)) ≥ 0
  normalization : state A.one = 1
  KMScondition : ∀ x y, state (A.multiplication x y) = state (A.multiplication y (α (Complex.I) x))

structure KMSStateEvidence {A : CStarAlgebraPackage} {α : ℝ → A.carrier → A.carrier} (K : KMSStatePackage A α) where
  positivityClosed : K.positivity
  normalizationClosed : K.normalization
  KMSconditionClosed : K.KMScondition

def KMSStateClosed {A : CStarAlgebraPackage} {α : ℝ → A.carrier → A.carrier} (K : KMSStatePackage A α) : Prop :=
  K.positivity ∧ K.normalization ∧ K.KMScondition

theorem kms_state_closed_from_evidence {A : CStarAlgebraPackage} {α : ℝ → A.carrier → A.carrier} (K : KMSStatePackage A α) (E : KMSStateEvidence K) :
    KMSStateClosed K := by
  exact And.intro E.positivityClosed (And.intro E.normalizationClosed E.KMSconditionClosed)

end DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse