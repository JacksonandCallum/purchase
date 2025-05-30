package com.example.service;

import com.example.entity.Warehouse_entry;
import com.example.mapper.Warehouse_entryMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class Warehouse_entryService {
    @Resource
    private Warehouse_entryMapper warehouse_entryMapper;


}
