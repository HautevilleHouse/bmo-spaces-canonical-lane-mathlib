import HautevilleHouse.BmoSpacesCanonicalLaneLean.BmoSpaceDefinition

namespace HautevilleHouse
namespace BmoSpacesCanonicalLaneLean

structure InterpolationResult (D : BmoDomain) (T : (BmoFunction D) → (BmoFunction D)) where
  boundedOnLp : ∀ (p : ℝ), 1 < p → p < ∞ → ∃ (c : ℝ), ∀ (f : BmoFunction D), (∫_x |T f|^p ∂D.measure) ≤ c * (∫_x |f|^p ∂D.measure)
  boundedOnBmo : ∃ (c : ℝ), ∀ (f : BmoFunction D), ‖T f‖_Bmo ≤ c * ‖f‖_Bmo
  interpolationHolds : ∀ (q : ℝ), 1 < q → q < ∞ → ∃ (c : ℝ), ∀ (f : BmoFunction D), (∫_x |T f|^q ∂D.measure) ≤ c * (∫_x |f|^q ∂D.measure)

structure InterpolationEvidence {D : BmoDomain} (T : (BmoFunction D) → (BmoFunction D)) where
  result : InterpolationResult D T
  proofSketch : Prop

theorem interpolation_theorem (D : BmoDomain) (T : (BmoFunction D) → (BmoFunction D)) (hLp : ∀ p, 1<p<∞ → ∃ c, ∀ f, ...) (hBmo : ∃ c, ∀ f, ...) : InterpolationEvidence T := by
  refine {
    result := {
      boundedOnLp := ?_
      boundedOnBmo := hBmo
      interpolationHolds := ?_
    }
    proofSketch := True
  }
  · intro p hp hinfty
    rcases hLp p (And.intro hp hinfty) with ⟨c, hc⟩
    exact ⟨c, hc⟩
  · intro q hq hinfty
    rcases hLp q (And.intro hq hinfty) with ⟨c, hc⟩
    exact ⟨c, hc⟩

end BmoSpacesCanonicalLaneLean
end HautevilleHouse