\name{chromatogram-methods}
\docType{methods}
\alias{chromatogram-methods}
\alias{chromatogram,data.frame-method}
\alias{chromatogram,character-method}
\alias{chromatogram,mzRramp-method}
\alias{chromatogram}

\title{ Plots a chromatogram }

\description{
  The method plot the chromatogram for various types in inputs (see
  below). Additional arguments are
  \describe{
    \item{y}{One of \code{"tic"} (default) or \code{"bpi"} to plot the
      total ion current of base peak intensity chromatogram. }
    \item{f}{Optional and only when the input is a
      \code{data.frame}. Otherwise, it is extracted automatically from 
      \code{object}. \code{f} is used to print the filename on the
      figure. }
    \item{legend}{A \code{logical} defining if the figure should be
      annotated. }
    \item{plot}{A \code{logical} defining if the plot should be
      rendered. }
    \item{ms}{A \code{numeric} defining what MS level spectra to
      use. Default is \code{1L}. }
    \item{...}{Additional arguments passed to the \code{plot}
      function. } 
  }  

  xcms::plotChrom provides a similar functionality.
}

\value{
  The methods invisibly return the \code{data.frame} with the retention
  times (\code{rt} column) and intensities (either \code{tic} or
  \code{bpi}) used to generate the figure.  
}

\section{Methods}{
  \describe{
    \item{\code{signature(object = "character")}}{ Plots the chromatogram
      for the mass-spectrometry data stored in the \code{object}
      file. The file format must be support by \code{mzR}. See
      \code{mzR::openMSfile} for details.
    }
    \item{\code{signature(object = "mzRramp")}}{ Plots the chromatogram
      for the \code{mzRramp} instance. See the \code{mzR} package for
      details. 
    }
    \item{\code{signature(object = "data.frame")}}{ Plots the
      chromatogram using the relevant columns from the \code{data.frame}
      instance, i.e \code{retentionTime} and \code{totIonCurrent} (for
      \code{tic}) and \code{basePeakIntensity} (for \code{bpi}). 
      Such a data.frame would typically be generated by extracting the
      header from an \code{mzRramp} instance. See \code{mzR::header} for
      details. 
    }
  }
}

\examples{
f <- system.file("lockmass/LockMass_test.mzXML", package = "msdata")
x <- chromatogram(f, main = "Source: mzXML file")
head(x)
dim(x)
x <- chromatogram(f, main = "Source: mzXML file",
                  ylim = c(0, 100))
\dontrun{
    library("mzR")
    ms <- openMSfile(f)
    chromatogram(ms, main = "Source: mzRramp",
                 col = "red")
    hd <- header(ms)
    chromatogram(hd, main = "Source: mzRramp header",
                 lty = "dashed")

    library("RforProteomics")
    f <- getPXD000001mzXML()
    chromatogram(f)
    grid()
  }
}

\keyword{methods}

