import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean.DynamicalSystemCAlgebraFoundation
import DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean.CrossedProduct

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean

structure EquivariantHilbertModule (G : Type u) [Group G] (A : CStarAlgebra) (α : GroupAction G A) where
  carrier : Type v
  innerProduct : carrier → carrier → A.carrier
  action : G → carrier → carrier
  innerProductAction : ∀ g : G, ∀ x y : carrier, innerProduct (action g x) (action g y) = α.action g (innerProduct x y)

structure EquivariantKKCycle (G : Type u) [Group G] (A B : CStarAlgebra) (α : GroupAction G A) (β : GroupAction G B) where
  hilbertModule : EquivariantHilbertModule G B β
  representationA : A.carrier → (hilbertModule.carrier → hilbertModule.carrier)
  representationB : B.carrier → (hilbertModule.carrier → hilbertModule.carrier)
  representationACompat : ∀ a a' : A.carrier, representationA (A.multiplication a a') = (representationA a) ∘ (representationA a')
  representationBCompat : ∀ b b' : B.carrier, representationB (B.multiplication b b') = (representationB b) ∘ (representationB b')

structure EquivariantKasiKasparovProduct (G : Type u) [Group G] (A B C : CStarAlgebra) (α : GroupAction G A) (β : GroupAction G B) (γ : GroupAction G C) where
  cycleAB : EquivariantKKCycle G A B α β
  cycleBC : EquivariantKKCycle G B C β γ
  productCycle : EquivariantKKCycle G A C α γ

end DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse