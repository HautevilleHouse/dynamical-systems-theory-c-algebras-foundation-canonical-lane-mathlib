import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean.CStarDynamicalSystem

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean

structure KKTheoryBottPeriodicity (A B : CStarDynamicalSystem) where
  kkGroup : Type u
  bottMap : kkGroup → kkGroup
  periodicityIsomorphism : Prop
  periodicityIsomorphismTerm : periodicityIsomorphism

structure KKTheoryBottPeriodicityEvidence (A B : CStarDynamicalSystem)
    (K : KKTheoryBottPeriodicity A B) where
  periodicityIsomorphismClosed : K.periodicityIsomorphism

def KKTheoryBottPeriodicityClosed (A B : CStarDynamicalSystem)
    (K : KKTheoryBottPeriodicity A B) : Prop :=
  K.periodicityIsomorphism

theorem kk_theory_bott_periodicity_closed_from_evidence (A B : CStarDynamicalSystem)
    (K : KKTheoryBottPeriodicity A B) (E : KKTheoryBottPeriodicityEvidence A B K) :
    KKTheoryBottPeriodicityClosed A B K := by
  exact E.periodicityIsomorphismClosed

end DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse