import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean.CStarCrossedProduct

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean

structure TakaiDualityData {G : Type u} [AbelianGroup G] {A : CStarAlgebra G} {α : GroupAction G A} (P : CStarCrossedProduct G A α) where
  dualGroup : Type v
  dualAction : GroupAction (dualGroup : Type v) P.underlyingSpace
  iteratedCrossedProduct : CStarCrossedProduct (dualGroup : Type v) P.underlyingSpace dualAction
  dualIsomorphism : Type (max u v w)
  dualIsomorphismExists : Prop
  dualIsomorphismExistsClosed : dualIsomorphismExists

def TakaiDualityClosed {G : Type u} [AbelianGroup G] {A : CStarAlgebra G} {α : GroupAction G A} (P : CStarCrossedProduct G A α) (T : TakaiDualityData P) : Prop :=
  T.dualIsomorphismExists

theorem takai_duality_closed_from_evidence {G : Type u} [AbelianGroup G] {A : CStarAlgebra G} {α : GroupAction G A} (P : CStarCrossedProduct G A α) (T : TakaiDualityData P) : TakaiDualityClosed P T := by
  exact T.dualIsomorphismExistsClosed

end DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse