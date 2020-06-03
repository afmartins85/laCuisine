#include "categorymodel.h"

/**
 * @brief CategoryModel::CategoryModel
 * @param parent
 */
CategoryModel::CategoryModel(QObject *parent) : QObject(parent)
{
    m_categoryModel.clear();
}

/**
 * @brief CategoryModel::title
 * @return
 */
QString CategoryModel::title() const
{
    return m_title;
}

/**
 * @brief CategoryModel::getAllCategories
 * @return
 */
QList<QObject *> CategoryModel::getAllCategories()
{
    return m_categoryModel;
}

/**
 * @brief CategoryModel::size
 * @return
 */
int CategoryModel::size()
{
    return m_categoryModel.size();
}

/**
 * @brief CategoryModel::setTitle
 * @param title
 */
void CategoryModel::setTitle(QString title)
{
    if (m_title == title)
        return;

    m_title = title;
    emit titleChanged(m_title);
}

/**
 * @brief CategoryModel::loadHardList
 */
void CategoryModel::loadHardList()
{
    CategoryModel *firstCategory = new CategoryModel;
    firstCategory->setTitle("PRATOS\n DE ENTRADA");
    m_categoryModel.append(firstCategory);

    CategoryModel *secondCategory = new CategoryModel;
    secondCategory->setTitle("PRATOS\n PRINCIPAIS");
    m_categoryModel.append(secondCategory);

    CategoryModel *thirdCategory = new CategoryModel;
    thirdCategory->setTitle("SOBREMESAS");
    m_categoryModel.append(thirdCategory);

    CategoryModel *fourthCategory = new CategoryModel;
    fourthCategory->setTitle("BEBIDAS");
    m_categoryModel.append(fourthCategory);
}
