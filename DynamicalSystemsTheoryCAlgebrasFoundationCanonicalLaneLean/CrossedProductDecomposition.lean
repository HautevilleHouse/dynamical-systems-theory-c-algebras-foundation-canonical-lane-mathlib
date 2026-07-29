import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean

structure CrossedProduct (G : Type u) [Group G] (A : Type v) [CStarAlgebra A] where
  action : G → A → A
  covariantRepresentation : Prop
  reducedCrossedProduct : Type w
  fullCrossedProduct : Type w
  nuclearityCondition : Prop

structure CrossedProductEvidence (G : Type u) [Group G] (A : Type v) [CStarAlgebra A] (C : CrossedProduct G A) where
  covariantRepresentationClosed : C.covariantRepresentation
  nuclearityConditionClosed : C.nuclearityCondition

def CrossedProductClosed (G : Type u) [Group G] (A : Type v) [CStarAlgebra A] (C : CrossedProduct G A) : Prop :=
  C.covariantRepresentation ∧ C.nuclearityCondition

theorem crossed_product_closed_from_evidence (G : Type u) [Group G] (A : Type v) [CStarAlgebra A] (C : CrossedProduct G A) (E : CrossedProductEvidence G A C) : CrossedProductClosed G A C := by
  exact And.intro E.covariantRepresentationClosed E.nuclearityConditionClosed

end DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse