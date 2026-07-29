import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean

structure KMSState where
  inverseTemperature : ℝ
  stateFunctional : (Type u → Type v) → ℂ
  modularStructure : Prop

structure KMSStateEvidence (K : KMSState) where
  modularStructureClosed : K.modularStructure
  groundStateCondition : Prop
  thermalEquilibrium : Prop

def KMSStateClosed (K : KMSState) : Prop :=
  K.modularStructure

theorem kms_state_closed_from_evidence (K : KMSState) (E : KMSStateEvidence K) : KMSStateClosed K := by
  exact E.modularStructureClosed

end DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse