import canonicalLaneMathlib.AdmissibleClass
import BmoSpacesCanonicalLaneLean.BmoDefinition

namespace HautevilleHouse
namespace BmoSpacesCanonicalLaneLean

structure HardySpace where
  underlyingSpace : Type u
  hardyNorm : (underlyingSpace → ℝ) → ℝ
  atomicDecomposition : Prop

structure DualityPairing (P : BmoPackage) (H : HardySpace) where
  pairingMap : (P.space.underlyingSpace → ℝ) → (H.underlyingSpace → ℝ) → ℝ
  dualityIsomorphism : Prop
  normEquivalence : Prop

structure DualityEvidence {P : BmoPackage} {H : HardySpace} (D : DualityPairing P H) where
  dualityIsomorphismClosed : D.dualityIsomorphism
  normEquivalenceClosed : D.normEquivalence

def DualityClosed {P : BmoPackage} {H : HardySpace} (D : DualityPairing P H) : Prop :=
  D.dualityIsomorphism ∧ D.normEquivalence

theorem duality_closed_from_evidence {P : BmoPackage} {H : HardySpace} (D : DualityPairing P H) (E : DualityEvidence D) : DualityClosed D := by
  exact And.intro E.dualityIsomorphismClosed E.normEquivalenceClosed

end BmoSpacesCanonicalLaneLean
end HautevilleHouse