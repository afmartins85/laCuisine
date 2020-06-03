#ifndef CATEGORYMODEL_H
#define CATEGORYMODEL_H

#include <QObject>

class CategoryModel : public QObject
{
    Q_OBJECT
public:
    explicit CategoryModel(QObject *parent = nullptr);

signals:

};

#endif // CATEGORYMODEL_H
