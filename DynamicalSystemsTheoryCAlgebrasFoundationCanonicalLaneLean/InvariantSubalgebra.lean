import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean

structure InvariantSubalgebraPackage (A : CStarAlgebraPackage) (G : AutomorphismGroupPackage A) where
  subalgebraCarrier : Set A.carrier
  closedUnderMult : ∀ x y, x ∈ subalgebraCarrier → y ∈ subalgebraCarrier → A.multiplication x y ∈ subalgebraCarrier
  closedUnderInvolution : ∀ x, x ∈ subalgebraCarrier → A.involution x ∈ subalgebraCarrier
  closedUnderAction : ∀ g ∈ G.groupCarrier, ∀ x, x ∈ subalgebraCarrier → G.action g x ∈ subalgebraCarrier

structure InvariantSubalgebraEvidence {A : CStarAlgebraPackage} {G : AutomorphismGroupPackage A} (S : InvariantSubalgebraPackage A G) where
  closedUnderMultClosed : S.closedUnderMult
  closedUnderInvolutionClosed : S.closedUnderInvolution
  closedUnderActionClosed : S.closedUnderAction

def InvariantSubalgebraClosed {A : CStarAlgebraPackage} {G : AutomorphismGroupPackage A} (S : InvariantSubalgebraPackage A G) : Prop :=
  S.closedUnderMult ∧ S.closedUnderInvolution ∧ S.closedUnderAction

theorem invariant_subalgebra_closed_from_evidence {A : CStarAlgebraPackage} {G : AutomorphismGroupPackage A} (S : InvariantSubalgebraPackage A G) (E : InvariantSubalgebraEvidence S) :
    InvariantSubalgebraClosed S := by
  exact And.intro E.closedUnderMultClosed (And.intro E.closedUnderInvolutionClosed E.closedUnderActionClosed)

end DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse