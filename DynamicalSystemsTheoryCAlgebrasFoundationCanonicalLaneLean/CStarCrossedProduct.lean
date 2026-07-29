import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean

structure CStarAlgebra (A : Type u) where
  carrier : Type v
  norm : carrier → ℝ
  mul : carrier → carrier → carrier
  star : carrier → carrier
  unit : carrier
  norm_mul : ∀ x y : carrier, norm (mul x y) ≤ norm x * norm y
  CStarIdentity : ∀ x : carrier, norm (star x * x) = (norm x)^2
  completeness : CompleteSpace carrier

structure GroupAction (G : Type u) [Group G] (A : CStarAlgebra G) where
  action : G → A.carrier → A.carrier
  isAction : Type (max u v)

structure CStarCrossedProduct (G : Type u) [Group G] (A : CStarAlgebra G) (α : GroupAction G A) where
  underlyingSpace : Type w
  norm : underlyingSpace → ℝ
  star : underlyingSpace → underlyingSpace
  mul : underlyingSpace → underlyingSpace → underlyingSpace
  unit : underlyingSpace
  completeness : CompleteSpace underlyingSpace
  reduced : Prop
  full : Prop

structure CStarCrossedProductEvidence {G : Type u} [Group G] {A : CStarAlgebra G} {α : GroupAction G A} (P : CStarCrossedProduct G A α) where
  reducedClosed : P.reduced
  fullClosed : P.full

def CStarCrossedProductClosed {G : Type u} [Group G] {A : CStarAlgebra G} {α : GroupAction G A} (P : CStarCrossedProduct G A α) : Prop :=
  P.reduced ∧ P.full

theorem cstar_crossed_product_closed_from_evidence {G : Type u} [Group G] {A : CStarAlgebra G} {α : GroupAction G A} (P : CStarCrossedProduct G A α) (E : CStarCrossedProductEvidence P) : CStarCrossedProductClosed P := by
  exact And.intro E.reducedClosed E.fullClosed

end DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse