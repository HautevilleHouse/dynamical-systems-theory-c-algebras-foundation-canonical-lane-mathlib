import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasFoundation

structure CrossedProductPackage where
  action : Type u
  algebra : Type v
  covariantRepresentation : Prop
  crossedProductDefined : Prop
  takaiDuality : Prop

structure CrossedProductEvidence (C : CrossedProductPackage) where
  covariantRepresentationClosed : C.covariantRepresentation
  crossedProductDefinedClosed : C.crossedProductDefined
  takaiDualityClosed : C.takaiDuality

def CrossedProductClosed (C : CrossedProductPackage) : Prop :=
  C.covariantRepresentation ∧ C.crossedProductDefined ∧ C.takaiDuality

theorem crossed_product_closed_from_evidence (C : CrossedProductPackage) (E : CrossedProductEvidence C) :
    CrossedProductClosed C := by
  exact And.intro E.covariantRepresentationClosed
    (And.intro E.crossedProductDefinedClosed E.takaiDualityClosed)

end DynamicalSystemsTheoryCAlgebrasFoundation
end HautevilleHouse