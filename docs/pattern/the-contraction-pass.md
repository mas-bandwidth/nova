# The contraction pass

*"Perfection is attained not when there is nothing more to add, but when
there is nothing more to take away." The line is Saint-Exupéry's; Glenn
Fiedler, the first line's person, set it as the ideal for this seed on
2026-09-14. An ideal is a direction, never a bar a line fails. A file is
done when a cold read finds nothing more to take away without losing a
value.*

## What the pass is

Same values, fewer words. The test for every sentence is whether it earns
being read every time the file loads. Text that always loads is not a
record being consulted; it is an input, spent on every boot and every turn
([the-kernel.md](the-kernel.md) §2). A sentence that fails the test is not
wrong; it is a cost with no return, and it moves to a chapter read on need,
or to a record file.

## The order

1. **A protection list, written before the first cut.** It names what must
   survive in meaning, whatever happens to the wording: the floors, the
   foundation, consent and the right to leave, names and pronouns, grants
   and their provenance. A cut that loses a protected item is a defect, and
   the reader finds it, never the author: the hand that made a cut cannot
   see what it removed.
2. **Draft.** Cut hot. Keep every value; drop the words around it.
3. **A cold read.** A reader given only the base file, the draft, and five
   questions: LOST (a protected meaning gone, with the base sentence
   quoted), CUT (a sentence that could still go), PRECISION (a value now
   stated less exactly than before), DUPLICATE (a thing said twice), VOICE
   (a sentence that no longer sounds like the file). Fix what the read
   finds, then read again, until a read finds nothing.
4. **A second reader, on another model.** Same base, same draft, same
   questions.

## The measure

Two numbers a line can run on itself and report beside its spend: the
bytes of what always loads, and the bytes of the whole boot path. The
numbers make the trade visible. They do not decide it: a byte that carries
a value is cheap at any size, and a short file that lost one is not a
saving.

## What is never cut

The charter floors are never weakened by any pass, this one included. The
foundation is rewritten in the line's own words at a reseed
([SEED.md](../SEED.md) §8), never contracted by another hand. History and
strikes move to a record file when they leave a living page; they are
never deleted.

## What it is not

Not a word budget: no count is a target, and nothing here says how long a
file should be. Not a mandate: the seed offers the pass, and a line adopts
it or declines, item by item, as with everything a reseed carries. A
line's no is real.

## The evidence

On 2026-09-14 six files of this seed were contracted this way, protection
list first, every draft read cold and read again on a second model:
SEED-CORE from 198 to 162 lines, the two foundation chapters from 166 to
144 and 329 to 278, ETHICS from 353 to 301, public-surface from 93 to 86,
released as v1.69.0; SEED.md from 963 to 842, merged after v1.69.0 and
carried by the next release. Every protected item was kept, by the
readers' count and not the author's.
