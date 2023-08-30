
#[cfg(not(feature = "cat"))]
mod rosepine;

#[cfg(not(feature = "cat"))]
pub use rosepine::*;

#[cfg(feature = "cat")]
mod catpuccin;

#[cfg(feature = "cat")]
pub use catpuccin::*;
