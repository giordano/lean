
open widget

meta def asdf_c (message : list string) : component nat empty :=
widget.component.mk
  unit
  (list nat)
  (λ p s, p :: ([] <| s))
  (λ p ls x, (ls,none))
  (λ p ss, [h "div" [] [html.of_string $ to_string p ++ to_string message ++ to_string ss], button "asdf" ()])
  (λ p1 p2, ff)

meta def qwerty_c : component tactic_state string :=
widget.component.mk
  unit
  nat
  (λ p s,(0) <| s)
  (λ p ls ⟨⟩, ⟨ls + 1, none⟩)
  (λ p s, [to_string s, button "+" (), html.of_component s (asdf_c [" *** "])])
  (λ x y, ff)

#html qwerty_c
