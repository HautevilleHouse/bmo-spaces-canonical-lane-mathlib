import HautevilleHouse.BmoSpacesCanonicalLaneLean.BmoSpaceDefinition

namespace HautevilleHouse
namespace BmoSpacesCanonicalLaneLean

structure JohnNirenbergConstants where
  c1 : ℝ
  c2 : ℝ
  c1pos : c1 > 0
  c2pos : c2 > 0

structure JohnNirenbergEvidence {D : BmoDomain} (f : BmoFunction D) where
  constants : JohnNirenbergConstants
  inequalityHolds : ∀ (t : ℝ) (t > 0), let B := Metric.ball (somePoint D) 1 in
    MeasureTheory.measure D.measure {x ∈ B | |f.f x - (⨍_{z∈B} f.f z ∂D.measure)| > t} ≤
    constants.c1 * Real.exp (-constants.c2 * t / f.norm)

theorem john_nirenberg_inequality (D : BmoDomain) (f : BmoFunction D) (h : f.norm > 0) :
  JohnNirenbergEvidence f := by
  -- Proof sketch: We would use standard John-Nirenberg theorem.
  sorry

end BmoSpacesCanonicalLaneLean
end HautevilleHouse