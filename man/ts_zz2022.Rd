% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/TS_ZZ2022.R
\name{ts_zz2022}
\alias{ts_zz2022}
\title{Test proposed by Zhang and Zhu (2022)}
\usage{
ts_zz2022(y1, y2)
}
\arguments{
\item{y1}{The data matrix (\eqn{p} by \eqn{n_1}) from the first population. Each column represents a \eqn{p}-dimensional observation.}

\item{y2}{The data matrix (\eqn{p} by \eqn{n_2}) from the first population. Each column represents a \eqn{p}-dimensional observation.}
}
\value{
A  (list) object of  \code{S3} class \code{htest}  containing the following elements:
\describe{
\item{p.value}{the p-value of the test proposed by Zhang and Zhu (2022).}
\item{statistic}{the test statistic proposed by Zhang and Zhu (2022).}
\item{beta0}{parameter used in Zhang and Zhu (2022)'s test}
\item{beta1}{parameter used in Zhang and Zhu (2022)'s test}
\item{df}{estimated approximate degrees of freedom of Zhang and Zhu (2022)'s test.}
}
}
\description{
Zhang and Zhu (2022)'s test for testing equality of two-sample high-dimensional mean vectors with assuming that two covariance matrices are the same.
}
\details{
Suppose we have two independent high-dimensional samples:
\deqn{
\boldsymbol{y}_{i1},\ldots,\boldsymbol{y}_{in_i}, \;\operatorname{are \; i.i.d. \; with}\; \operatorname{E}(\boldsymbol{y}_{i1})=\boldsymbol{\mu}_i,\; \operatorname{Cov}(\boldsymbol{y}_{i1})=\boldsymbol{\Sigma},i=1,2.
}
The primary object is to test
\deqn{H_{0}: \boldsymbol{\mu}_1 = \boldsymbol{\mu}_2\; \operatorname{versus}\; H_{1}: \boldsymbol{\mu}_1 \neq \boldsymbol{\mu}_2.}
Zhang et al.(2022) proposed the following test statistic:
\deqn{T_{ZZ} = \frac{n_1n_2}{n} \|\bar{\boldsymbol{y}}_1 - \bar{\boldsymbol{y}}_2\|^2-\operatorname{tr}(\hat{\boldsymbol{\Sigma}}),}
where  \eqn{\bar{\boldsymbol{y}}_{i},i=1,2} are the sample mean vectors and \eqn{\hat{\boldsymbol{\Sigma}}} is the pooled sample covariance matrix.
They showed that under the null hypothesis, \eqn{T_{ZZ}} and a chi-squared-type mixture have the same normal or non-normal limiting distribution.
}
\examples{
set.seed(1234)
n1 <- 20
n2 <- 30
p <- 50
mu1 <- t(t(rep(0, p)))
mu2 <- mu1
rho <- 0.1
y <- (-2 * sqrt(1 - rho) + sqrt(4 * (1 - rho) + 4 * p * rho)) / (2 * p)
x <- y + sqrt((1 - rho))
Gamma <- matrix(rep(y, p * p), nrow = p)
diag(Gamma) <- rep(x, p)
Z1 <- matrix(rnorm(n1 * p, mean = 0, sd = 1), p, n1)
Z2 <- matrix(rnorm(n2 * p, mean = 0, sd = 1), p, n2)
y1 <- Gamma \%*\% Z1 + mu1 \%*\% (rep(1, n1))
y2 <- Gamma \%*\% Z2 + mu2 \%*\% (rep(1, n2))
ts_zz2022(y1, y2)

}
\references{
\insertRef{zhang2022revisit}{HDNRA}
}
\concept{nrats}
