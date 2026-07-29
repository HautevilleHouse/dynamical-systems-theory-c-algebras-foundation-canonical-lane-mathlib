import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean

structure CrossedProductPackage (A : CStarAlgebraPackage) (G : AutomorphismGroupPackage A) where
  crossedProductCarrier : Type u
  norm : crossedProductCarrier → ℝ
  involution : crossedProductCarrier → crossedProductCarrier
  multiplication : crossedProductCarrier → crossedProductCarrier → crossedProductCarrier
  addition : crossedProductCarrier → crossedProductCarrier → crossedProductCarrier
  zero : crossedProductCarrier
  CStarIdentity : ∀ x, ‖x * x†‖ = ‖x‖^2
  universalProperty : Prop
  reducedRepresentation : Prop

structure CrossedProductEvidence {A : CStarAlgebraPackage} {G : AutomorphismGroupPackage A} (CP : CrossedProductPackage A G) where
  CStarIdentityClosed : CP.CStarIdentity
  universalPropertyClosed : CP.universalProperty
  reducedRepresentationClosed : CP.reducedRepresentation

def CrossedProductClosed {A : CStarAlgebraPackage} {G : AutomorphismGroupPackage A} (CP : CrossedProductPackage A G) : Prop :=
  CP.CStarIdentity ∧ CP.universalProperty ∧ CP.reducedRepresentation

theorem crossed_product_closed_from_evidence {A : CStarAlgebraPackage} {G : AutomorphismGroupPackage A} (CP : CrossedProductPackage A G) (E : CrossedProductEvidence CP) :
    CrossedProductClosed CP := by
  exact And.intro E.CStarIdentityClosed (And.intro E.universalPropertyClosed E.reducedRepresentationClosed)

end DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse