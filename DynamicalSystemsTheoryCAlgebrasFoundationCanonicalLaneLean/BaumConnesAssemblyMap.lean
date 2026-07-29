import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean.DynamicalSystemCAlgebraFoundation
import DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean.CrossedProduct
import DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean.EquivariantKKTheory

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean

structure ClassifyingSpace (G : Type u) [Group G] where
  carrier : Type v
  contractible : Prop
  freeAction : G → carrier → carrier

structure AssemblyMap (G : Type u) [Group G] (A : CStarAlgebra) (α : GroupAction G A) where
  geometricSide : EquivariantKKCycle G A (ClassifyingSpace G) α (defaultAction G (ClassifyingSpace G))
  analyticSide : EquivariantKKCycle G A (CrossedProductCStarAlgebra G A α).crossedProductCStar α (defaultAction G (CrossedProductCStarAlgebra G A α).crossedProductCStar)
  isomorphism : Prop

structure BaumConnesConjecture (G : Type u) [Group G] (A : CStarAlgebra) (α : GroupAction G A) where
  assemblyMap : AssemblyMap G A α
  assemblyMapIsIsomorphism : assemblyMap.isomorphism

end DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse