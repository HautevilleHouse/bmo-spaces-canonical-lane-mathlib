import HautevilleHouse.BmoSpacesCanonicalLaneLean.BmoAdmissibleClass

namespace HautevilleHouse
namespace BmoSpacesCanonicalLaneLean

structure DualityH1BMOPackage (O : BmoAdmittedObject) where
  h1Space : Type u
  pairing : H1Function × BmoFunction → ℝ
  isometricIsomorphism : Prop
  feffermanTheorem : Prop

structure DualityH1BMOEvidence (O : BmoAdmittedObject) (D : DualityH1BMOPackage O) where
  isometricIsomorphismClosed : D.isometricIsomorphism
  feffermanTheoremClosed : D.feffermanTheorem

def DualityH1BMOClosed (O : BmoAdmittedObject) (D : DualityH1BMOPackage O) : Prop :=
  D.isometricIsomorphism ∧ D.feffermanTheorem

theorem duality_h1_bmo_closed_from_evidence (O : BmoAdmittedObject) (D : DualityH1BMOPackage O) (E : DualityH1BMOEvidence O D) : DualityH1BMOClosed O D := by
  exact And.intro E.isometricIsomorphismClosed E.feffermanTheoremClosed

end BmoSpacesCanonicalLaneLean
end HautevilleHouse