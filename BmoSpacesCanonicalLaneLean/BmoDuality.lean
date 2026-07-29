import HautevilleHouse.BmoSpacesCanonicalLaneLean.BmoSpaceDefinition
import HautevilleHouse.BmoSpacesCanonicalLaneLean.JohnNirenbergInequality

namespace HautevilleHouse
namespace BmoSpacesCanonicalLaneLean

structure H1Space (D : BmoDomain) where
  atoms : Set (BmoFunction D)
  normed : SeminormedAddCommGroup (Subtype (· ∈ atoms))
  complete : IsComplete (Set.univ : Set (Subtype (· ∈ atoms)))

structure DualityPairing (D : BmoDomain) (H : H1Space D) (B : BmoSpace D) where
  pairing : (Subtype (· ∈ H.atoms)) → (Subtype (· ∈ B.functions)) → ℝ
  isometricIsomorphism : Isometry (fun (h : Subtype (· ∈ H.atoms)) => (fun (b : Subtype (· ∈ B.functions)) => pairing h b))

structure DualityEvidence (D : BmoDomain) (H : H1Space D) (B : BmoSpace D) where
  isDual : IsomorphicAsNormedSpaces (Dual H.normed) B.normed
  witnesses : DualityPairing D H B

theorem h1_bmo_dual (D : BmoDomain) (H : H1Space D) (B : BmoSpace D) (hH : H.complete) (hB : B.complete) : DualityEvidence D H B := by
  sorry

end BmoSpacesCanonicalLaneLean
end HautevilleHouse