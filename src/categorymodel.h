#ifndef CATEGORYMODEL_H
#define CATEGORYMODEL_H

#include <QObject>

class CategoryModel : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString title READ title WRITE setTitle NOTIFY titleChanged)

public:
    explicit CategoryModel(QObject *parent = nullptr);
    //! Return the title of category
    QString title() const;
    //! Return the list of categories
    Q_INVOKABLE QList<QObject *> getAllCategories();
    //! Return the size list
    Q_INVOKABLE int size();
    //!Load hardcoded list
    Q_INVOKABLE void loadHardList();

public slots:
    //! Set title of category
    void setTitle(QString title);

signals:
    void titleChanged(QString title);

private:
    QString m_title;
    QList<QObject*> m_categoryModel;

};

#endif // CATEGORYMODEL_H
