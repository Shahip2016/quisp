/** \file ResourceManager.h
 *  \authors cldurand
 *  \date 2018/05/25
 *
 *  \brief ResourceManager
 */

#ifndef QUISP_MODULES_RESOURCEMANAGER_H_
#define QUISP_MODULES_RESOURCEMANAGER_H_
#include <omnetpp.h>
#include <classical_messages_m.h>

using namespace omnetpp;

namespace quisp {
namespace modules {

/** \class ResourceManager ResourceManager.h
 *  \todo Documentation of the class header.
 *
 *  \brief ResourceManager
 */
class ResourceManager : public cSimpleModule
{
    private:
    protected:
        virtual void initialize() override;
        virtual void handleMessage(cMessage *msg) override;
    public:
};

} // namespace modules
} // namespace quisp

#endif /* QUISP_MODULES_RESOURCEMANAGER_H_ */
