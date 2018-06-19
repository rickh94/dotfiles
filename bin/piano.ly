\version "2.18.2"
\language "english"

\include "bin.ily"

\score {
	\header {
		instrument = "Piano"
	}
<<
	\new Staff {
		\violin
	}
	\new PianoStaff <<
		\new Staff {
			\pianoRH
		}
		\new Staff {
			\pianoLH
		}
	>>
>>
}
