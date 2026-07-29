import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean.DynamicalSystemsCAlgebrasFoundation
import DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean.KMSStatesEquilibrium
import DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean.CrossedProductDecomposition
import DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean.PoissonBracketQuantization
import DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean.EntropyKMSClassification

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  DynamicalSystemCAlgebraClosed (A.object : DynamicalSystemCAlgebra)

declare_syntaxchek bridgeClosed

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact match A.object with
  | ds : DynamicalSystemCAlgebra =>
    have : DynamicalSystemCAlgebraClosed ds := by
      -- proof from evidence fields of A
      exact dynamical_system_c_algebra_closed_from_evidence ds (by
        -- evidence is carried in A.gateWitness?
        sorry)
    exact this
  | _ => by
    -- add cases for other object types as needed
    sorry

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A :=
  A.gateWitness

end DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse