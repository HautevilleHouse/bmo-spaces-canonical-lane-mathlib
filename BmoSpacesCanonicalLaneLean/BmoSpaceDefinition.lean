import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BmoSpacesCanonicalLaneLean

structure BmoDomain where
  carrier : Type u
  metric : carrier → carrier → ℝ
  measure : Set carrier → ℝ≥0∞
  sigmaFinite : MeasureTheory.SigmaFinite measure

structure BmoFunction (D : BmoDomain) where
  f : D.carrier → ℝ
  norm : ℝ
  oscillationBounded : ∀ (x : D.carrier) (r : ℝ), r > 0 →
    ∃ (c : ℝ), (∀ y ∈ Metric.ball x r, |f y - (⨍_{z∈Metric.ball x r} f z ∂D.measure)| ≤ c) ∧ c ≤ norm

structure BmoSpace (D : BmoDomain) where
  functions : Set (BmoFunction D)
  normed : SeminormedAddCommGroup (Subtype (· ∈ functions))
  complete : IsComplete (Set.univ : Set (Subtype (· ∈ functions)))

end BmoSpacesCanonicalLaneLean
end HautevilleHouse