import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean

structure EntropyKMSClassifier where
  dynamicalEntropy : ℝ
  kMSStateCarrier : Type u
  kMSStateFunctional : kMSStateCarrier → ℂ
  classificationCriterion : Prop
  phaseTransitionDetected : Prop

structure EntropyKMSClassifierEvidence (E : EntropyKMSClassifier) where
  classificationCriterionClosed : E.classificationCriterion
  phaseTransitionDetectedClosed : E.phaseTransitionDetected

def EntropyKMSClassifierClosed (E : EntropyKMSClassifier) : Prop :=
  E.classificationCriterion ∧ E.phaseTransitionDetected

theorem entropy_kms_classifier_closed_from_evidence (E : EntropyKMSClassifier) (Ev : EntropyKMSClassifierEvidence E) : EntropyKMSClassifierClosed E := by
  exact And.intro Ev.classificationCriterionClosed Ev.phaseTransitionDetectedClosed

end DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse