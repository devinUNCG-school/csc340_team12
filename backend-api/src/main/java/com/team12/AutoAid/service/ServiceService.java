package com.team12.AutoAid.service;

import com.team12.AutoAid.entity.Service;
import java.util.List;

public interface ServiceService {
    List<Service> findAllServices();
    Service saveService(Service service);
}
