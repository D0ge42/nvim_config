#ifndef MATERIA_HPP
#define MATERIA_HPP

class Materia
{
  public:
    Materia(void);
    Materia(const Materia &other);
    ~Materia(void);

    Materia &operator=(const Materia &other);
};

#endif
