import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean

structure AutomorphismGroupPackage (A : CStarAlgebraPackage) where
  groupCarrier : Type u
  multiplication : groupCarrier → groupCarrier → groupCarrier
  identity : groupCarrier
  inverse : groupCarrier → groupCarrier
  action : groupCarrier → A.carrier → A.carrier
  automorphismProperty : ∀ φ ∈ groupCarrier, ∀ x y, action φ (A.multiplication x y) = A.multiplication (action φ x) (action φ y)
  continuityProperty : Prop

structure AutomorphismGroupEvidence {A : CStarAlgebraPackage} (G : AutomorphismGroupPackage A) where
  automorphismPropertyClosed : G.automorphismProperty
  continuityPropertyClosed : G.continuityProperty

def AutomorphismGroupClosed {A : CStarAlgebraPackage} (G : AutomorphismGroupPackage A) : Prop :=
  G.automorphismProperty ∧ G.continuityProperty

theorem automorphism_group_closed_from_evidence {A : CStarAlgebraPackage} (G : AutomorphismGroupPackage A) (E : AutomorphismGroupEvidence G) :
    AutomorphismGroupClosed G := by
  exact And.intro E.automorphismPropertyClosed E.continuityPropertyClosed

end DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse