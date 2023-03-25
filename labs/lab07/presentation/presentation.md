---
## Front matter
lang: ru-RU
title: Презентация по лабораторной работе № 7
subtitle: Математическое моделирование
author: Адебайо Р. А.
institute: Российский университет дружбы народов, Москва, Россия
date: 25 марта 2023
## i18n babel
babel-lang: russian
babel-otherlangs: english

## Formatting pdf
toc: false
toc-title: Содержание
slide_level: 2
aspectratio: 169
section-titles: true
theme: metropolis
header-includes:
 - \metroset{progressbar=frametitle,sectionpage=progressbar,numbering=fraction}
 - '\makeatletter'
 - '\beamer@ignorenonframefalse'
 - '\makeatother'
---

# Информация

## Докладчик

:::::::::::::: {.columns align=center}
::: {.column width="70%"}

* Адебайо Ридвануллахи Айофе
* студент группы НКНбд-01-20
* Факультет физико-математических и естественных наук
* Российский университет дружбы народов
* [Страничка на GitHub](https://github.com/PrinceKay145)
* [Страничка на LinkedIn](https://www.linkedin.com/in/ridwan-adebayo-0443a2231/)

:::
::::::::::::::

# Вводная часть

## Прагматика выполнения

* Познакомиться с моделью эффективность рекламы

* Использование Julia и OpenModelica  для выполнения лабораторных работ

* Применение полученных знаний на практике в дальнейшем

## Цель работы

* Рассмотреть простейшую модель "эффективность рекламы".

* Построить модель и визуализировать и анализировать графики эффективности распространения рекламы для трех случаев.

* Визуализировать модель с помощью Julia и OpenModelica

# Ход работы

## Задание

Постройте график распространения рекламы, математическая модель которой  описывается следующим уравнением:

1. $\frac{\mathrm{d}n}{\mathrm{d}t} = (0.55+0.0001n(t))(N-n(t))$

2. $\frac{\mathrm{d}n}{\mathrm{d}t} = (0.00005+0.2n(t))(N-n(t))$

3. $\frac{\mathrm{d}n}{\mathrm{d}t} = (0.05\sin(t)+0.3\cos(t)n(t))(N-n(t))$

При этом объем аудитории $N = 500$, в начальный момент о товаре знает 5 человек. Для случая 2 определите в какой момент времени скорость распространения рекламы будет иметь максимальное значение.

## Первый случай где $\alpha_1 >> \alpha_2$

$$\frac{\mathrm{d}n}{\mathrm{d}t} = (0.55+0.0001n(t))(N-n(t))$$

## Решение на Julia

```julia
using DifferentialEquations
using Plots
N=500
n=5
u0=[n]
t0=0
tmax=30
tspan=(t0,tmax)
function F(du, u, p, t)
    du[1]=(0.55+0.0001*u[1])*(N-u[1])
end
prob=ODEProblem(F, u0, tspan)
sol=solve(prob)
plot(sol, title= "Эффективность рекламы №1", lab="n(t)", linewidth=2)
savefig("../report/image/JLab71.png")
```

## Решение на OpenModelica

```M
model lab7
parameter Real N=500;
Real n(start=5);
equation
der(n)= (0.55+0.0001*n) *(N-n);
end lab7;
```

## Результаты

:::::::::::::: {.columns align=center}
::: {.column width="50%"}
![Модель эффективность рекламы №1(J)](../report/image/Jlab71.png){#fig:001 width=60%}
:::
::: {.column width="50%"}
![Модель эффективность рекламы №1(OM)](../report/image/Mlab71.png){#fig:002 width=90%}
:::
::::::::::::::

## Второй случай где $\alpha_1 << \alpha_2$

$\frac{\mathrm{d}n}{\mathrm{d}t} = (0.00005+0.2n(t))(N-n(t))$

## Решение на Julia

```julia
using DifferentialEquations
using Plots
N=500
n=5
u0=[n]
t0=0
tmax=1
tspan=(t0,tmax)
function F(du, u, p, t)
    du[1]=(0.00005+0.2*u[1])*(N-u[1])
end
prob=ODEProblem(F, u0, tspan)
sol=solve(prob)
plot(sol, title= "Эффективность рекламы №2", lab="n(t)", linewidth=2)
savefig("../report/image/JLab72.png")
```

## Решение на OpenModelica

```M
model lab7
parameter Real N=500;
Real n(start=5);
equation
der(n)= (0.00005+0.2*n) * (N-n);
end lab7;
```

## Результаты

:::::::::::::: {.columns align=center}
::: {.column width="50%"}
![Модель эффективность рекламы №2(J)](../report/image/Jlab72.png){#fig:003 width=60%}
:::
::: {.column width="50%"}
![Модель эффективность рекламы №2(OM)](../report/image/Mlab72.png){#fig:004 width=90%}
:::
::::::::::::::

## Третий случай где $\alpha_1, \alpha_2$ - периодические функции

$\frac{\mathrm{d}n}{\mathrm{d}t} = (0.05\sin(t)+0.3\cos(t)n(t))(N-n(t))$

## Решение на Julia

```julia
using DifferentialEquations
using Plots
N=500
n=5
u0=[n]
t0=0
tmax=1
tspan=(t0,tmax)
function F(du, u, p, t)
  du[1]=(0.5*sin(t)+0.3*cos(t)*u[1])*(N-u[1])
end
prob=ODEProblem(F, u0, tspan)
sol=solve(prob)
plot(sol, title= "Эффективность рекламы №3", lab="n(t)", linewidth=2)
savefig("../report/image/JLab73.png")
```

## Решение на OpenModelica

```M
model lab7
parameter Real N=500;
Real n(start=5);
equation
der(n)= (0.5 * sin(time)+0.3 * cos(time) * n) *(N-n);
end lab7;
```

## Результаты

:::::::::::::: {.columns align=center}
::: {.column width="50%"}
![Модель эффективность рекламы №2(J)](../report/image/Jlab73.png){#fig:003 width=60%}
:::
::: {.column width="50%"}
![Модель эффективность рекламы №2(OM)](../report/image/Mlab73.png){#fig:004 width=90%}
:::
::::::::::::::

# Вывод

* Мы научились работать на Julia и на OpenModelica

* Познакомился с простейшей моделью эффективность рекламы

* Научились строить графики

* Сравнил решения, учитывающее вклад только платной рекламы
